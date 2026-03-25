import AVFoundation
import Foundation

enum TimelineComposerError: LocalizedError {
    case noPlayableClips
    case noAudioTrack(URL)
    case exportSessionCreationFailed

    var errorDescription: String? {
        switch self {
        case .noPlayableClips:
            return "Onizleme veya export icin gecerli en az bir klip gerekli."
        case let .noAudioTrack(url):
            return "\(url.lastPathComponent) icin ses izi bulunamadi."
        case .exportSessionCreationFailed:
            return "Export oturumu olusturulamadi."
        }
    }
}

public struct TimelineComposer {
    private let timeScale: CMTimeScale = 600

    public init() {}

    @MainActor
    public func build(from clips: [MediaClip]) async throws -> TimelineBuildResult {
        let playableClips = clips.filter { $0.effectiveDuration > 0.05 }
        guard !playableClips.isEmpty else {
            throw TimelineComposerError.noPlayableClips
        }

        let composition = AVMutableComposition()
        guard let compositionTrack = composition.addMutableTrack(
            withMediaType: .audio,
            preferredTrackID: kCMPersistentTrackID_Invalid
        ) else {
            throw TimelineComposerError.noPlayableClips
        }

        let audioMix = AVMutableAudioMix()
        let inputParameters = AVMutableAudioMixInputParameters(track: compositionTrack)

        var cursor = CMTime.zero
        var offsets: [UUID: Double] = [:]

        for clip in playableClips {
            let duration = CMTime(seconds: clip.effectiveDuration, preferredTimescale: timeScale)

            if clip.isSilence {
                compositionTrack.insertEmptyTimeRange(CMTimeRange(start: cursor, duration: duration))
                offsets[clip.id] = cursor.seconds
                cursor = CMTimeAdd(cursor, duration)
                continue
            }

            guard let sourceURL = clip.sourceURL else {
                throw TimelineComposerError.noPlayableClips
            }

            let asset = AVURLAsset(url: sourceURL)
            let audioTracks = try await asset.loadTracks(withMediaType: .audio)

            guard let sourceTrack = audioTracks.first else {
                throw TimelineComposerError.noAudioTrack(sourceURL)
            }

            let start = CMTime(seconds: clip.trimStart, preferredTimescale: timeScale)
            let timeRange = CMTimeRange(start: start, duration: duration)

            try compositionTrack.insertTimeRange(timeRange, of: sourceTrack, at: cursor)
            applyVolumeEnvelope(for: clip, to: inputParameters, at: cursor)
            offsets[clip.id] = cursor.seconds
            cursor = CMTimeAdd(cursor, duration)
        }

        audioMix.inputParameters = [inputParameters]

        return TimelineBuildResult(
            composition: composition,
            audioMix: audioMix,
            clipOffsets: offsets,
            totalDuration: cursor.seconds
        )
    }

    private func applyVolumeEnvelope(
        for clip: MediaClip,
        to inputParameters: AVMutableAudioMixInputParameters,
        at cursor: CMTime
    ) {
        let volume = Float(clip.volume)
        let clipDuration = clip.effectiveDuration
        let clipEnd = CMTimeAdd(cursor, CMTime(seconds: clipDuration, preferredTimescale: timeScale))
        let fades = clip.normalizedFadeDurations

        if fades.fadeIn > 0 {
            let fadeInDuration = CMTime(seconds: fades.fadeIn, preferredTimescale: timeScale)
            inputParameters.setVolume(0, at: cursor)
            inputParameters.setVolumeRamp(
                fromStartVolume: 0,
                toEndVolume: volume,
                timeRange: CMTimeRange(start: cursor, duration: fadeInDuration)
            )
        } else {
            inputParameters.setVolume(volume, at: cursor)
        }

        if fades.fadeOut > 0 {
            let fadeOutStartSeconds = max(clipDuration - fades.fadeOut, 0)
            let fadeOutStart = CMTimeAdd(
                cursor,
                CMTime(seconds: fadeOutStartSeconds, preferredTimescale: timeScale)
            )
            let fadeOutDuration = CMTime(seconds: fades.fadeOut, preferredTimescale: timeScale)

            inputParameters.setVolume(volume, at: fadeOutStart)
            inputParameters.setVolumeRamp(
                fromStartVolume: volume,
                toEndVolume: 0,
                timeRange: CMTimeRange(start: fadeOutStart, duration: fadeOutDuration)
            )
            inputParameters.setVolume(0, at: clipEnd)
        } else {
            inputParameters.setVolume(volume, at: clipEnd)
        }
    }
}
