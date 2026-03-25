// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "LonerMAC",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(
            name: "LonerMAC",
            targets: ["LonerMAC"]
        )
    ],
    targets: [
        .executableTarget(
            name: "LonerMAC",
            path: "Sources/LonerMAC"
        )
    ]
)
