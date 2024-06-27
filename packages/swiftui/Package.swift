// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swiftui",
    platforms: [
        .macOS(.v10_15), .iOS(.v18), .tvOS(.v18)
    ],
    products: [
        .library(
            name: "swiftui",
            targets: ["swiftui"]),
    ],
    dependencies: [
        .package(name: "PhotoPicker", path: "../PhotoPicker")
    ],
    targets: [
        .target(
            name: "swiftui",
            dependencies: [
                "PhotoPicker"
            ]
        ),
        .testTarget(
            name: "swiftuiTests",
            dependencies: ["swiftui"]
        ),
    ]
)
