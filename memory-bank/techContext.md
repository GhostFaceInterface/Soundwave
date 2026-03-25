# Tech Context

## Stack
- Swift 6
- SwiftUI
- AVFoundation
- AppKit yalnizca dosya panelleri ve gereken macOS entegrasyonlari icin

## Build
- Swift Package
- Minimum platform: macOS 14
- Ana komut: `swift build`

## Constraints
- AVFoundation export katmaninda Swift 6 `Sendable` uyarilari var, ancak build bloklayici degil
- Klavye kisayollari AppKit/SwiftUI odak davranisi ile dikkatli entegre edilmeli
- Uzun waveform'larda performans icin `Canvas` tercih ediliyor
