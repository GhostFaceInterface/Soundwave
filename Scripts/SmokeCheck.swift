import AVFoundation
import Foundation

@main
struct SmokeCheck {
    @MainActor
    static func main() async {
        do {
            try await runChecks()
            print("Smoke checks passed.")
        } catch {
            fputs("Smoke checks failed: \(error)\n", stderr)
            exit(1)
        }
    }

    @MainActor
    private static func runChecks() async throws {
        let sourceURL = try makeToneFile(named: "smoke-source", duration: 1.5)
        defer { try? FileManager.default.removeItem(at: sourceURL) }

        let loader = MediaAssetLoader()
        var clip = try await loader.loadClip(from: sourceURL)
        guard clip.waveformSamples.count == 80 else {
            throw SmokeError.loaderValidationFailed
        }

        clip.trimStart = 0.2
        clip.trimEnd = 1.1
        clip.fadeInDuration = 0.1
        clip.fadeOutDuration = 0.1

        let silence = MediaClip.silence(durationSeconds: 0.5)
        let composer = TimelineComposer()
        let build = try await composer.build(from: [clip, silence])
        guard abs(build.totalDuration - 1.4) < 0.08 else {
            throw SmokeError.timelineValidationFailed
        }

        let persistenceURL = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString)
            .appendingPathExtension("json")
        defer { try? FileManager.default.removeItem(at: persistenceURL) }

        let persistence = ProjectPersistenceService()
        let project = SavedProject(
            clips: [clip, silence],
            exportSettings: ExportSettings(fileName: "Smoke", format: .caf)
        )
        try persistence.save(project: project, to: persistenceURL)
        let restored = try persistence.load(from: persistenceURL)
        guard restored.clips.count == 2, restored.exportSettings.format == .caf else {
            throw SmokeError.persistenceValidationFailed
        }

        let exportService = ExportService()
        let m4aURL = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString)
            .appendingPathExtension("m4a")
        let cafURL = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString)
            .appendingPathExtension("caf")
        defer {
            try? FileManager.default.removeItem(at: m4aURL)
            try? FileManager.default.removeItem(at: cafURL)
        }

        try await exportService.export(
            composition: build.composition,
            audioMix: build.audioMix,
            to: m4aURL,
            format: .m4a,
            progressHandler: { _ in }
        )

        try await exportService.export(
            composition: build.composition,
            audioMix: build.audioMix,
            to: cafURL,
            format: .caf,
            progressHandler: { _ in }
        )

        guard FileManager.default.fileExists(atPath: m4aURL.path),
              FileManager.default.fileExists(atPath: cafURL.path) else {
            throw SmokeError.exportValidationFailed
        }

        try await assertPlayableAudio(at: m4aURL)
        try await assertPlayableAudio(at: cafURL)
    }

    @MainActor
    private static func makeToneFile(named name: String, duration: Double) throws -> URL {
        let url = FileManager.default.temporaryDirectory
            .appendingPathComponent(name)
            .appendingPathExtension("caf")
        let format = AVAudioFormat(
            commonFormat: .pcmFormatFloat32,
            sampleRate: 44_100,
            channels: 1,
            interleaved: false
        )!

        let frameCount = AVAudioFrameCount(duration * format.sampleRate)
        let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: frameCount)!
        buffer.frameLength = frameCount

        let channel = buffer.floatChannelData![0]
        let frequency: Float = 440
        let amplitude: Float = 0.5
        for frame in 0..<Int(frameCount) {
            let time = Float(frame) / Float(format.sampleRate)
            channel[frame] = sin(2 * .pi * frequency * time) * amplitude
        }

        let file = try AVAudioFile(forWriting: url, settings: format.settings)
        try file.write(from: buffer)
        return url
    }

    @MainActor
    private static func assertPlayableAudio(at url: URL) async throws {
        let asset = AVURLAsset(url: url)
        let duration = try await asset.load(.duration).seconds
        let tracks = try await asset.loadTracks(withMediaType: .audio)

        guard duration > 0, !tracks.isEmpty else {
            throw SmokeError.exportValidationFailed
        }
    }
}

enum SmokeError: Error {
    case loaderValidationFailed
    case timelineValidationFailed
    case persistenceValidationFailed
    case exportValidationFailed
}
