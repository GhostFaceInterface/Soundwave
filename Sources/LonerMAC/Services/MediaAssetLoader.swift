import AVFoundation
import Foundation

enum MediaAssetLoaderError: LocalizedError {
    case noAudioTrack(URL)
    case invalidDuration(URL)

    var errorDescription: String? {
        switch self {
        case let .noAudioTrack(url):
            return "\(url.lastPathComponent) dosyasinda kullanilabilir bir ses izi bulunamadi."
        case let .invalidDuration(url):
            return "\(url.lastPathComponent) icin gecerli bir sure okunamadi."
        }
    }
}

public struct MediaAssetLoader {
    private let waveformService = AudioWaveformService()

    public init() {}

    @MainActor
    public func loadClip(from url: URL) async throws -> MediaClip {
        let asset = AVURLAsset(url: url)
        let duration = try await asset.load(.duration)
        let seconds = duration.seconds

        guard seconds.isFinite, seconds > 0 else {
            throw MediaAssetLoaderError.invalidDuration(url)
        }

        let audioTracks = try await asset.loadTracks(withMediaType: .audio)
        guard let audioTrack = audioTracks.first else {
            throw MediaAssetLoaderError.noAudioTrack(url)
        }

        let waveformSamples: [Float]
        do {
            waveformSamples = try waveformService.generateSamples(
                from: asset,
                audioTrack: audioTrack,
                durationSeconds: seconds
            )
        } catch {
            waveformSamples = Array(repeating: 0.12, count: 480)
        }

        return MediaClip(
            sourceURL: url,
            displayName: url.deletingPathExtension().lastPathComponent,
            durationSeconds: seconds,
            trimEnd: seconds,
            waveformSamples: waveformSamples
        )
    }
}
