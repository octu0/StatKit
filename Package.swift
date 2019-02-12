// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "StatKit",
    products: [
        .library(
            name: "StatKit",
            targets: ["StatKit"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "StatKit",
            dependencies: []
        ),
        .testTarget(
            name: "StatKitTests",
            dependencies: ["StatKit"]
        ),
    ]
)
