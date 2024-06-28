// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PhotoCalendar",
    platforms: [
        .macOS(.v10_14), .iOS(.v15), .tvOS(.v15)
    ],
    products: [
        .library(
            name: "PhotoCalendar",
            targets: ["PhotoCalendar"]),
    ],
    dependencies: [
        .package(name: "PhotoPicker", path: "../PhotoPicker"),
        .package(url: "https://github.com/apple/swift-testing.git", from: "0.6.0")
    ],
    targets: [
        .target(
            name: "PhotoCalendar",
            dependencies: [
                "PhotoPicker"
            ]
        ),
        .testTarget(
            name: "PhotoCalendarTests",
            dependencies: [
                "PhotoCalendar",
                .product(name: "Testing", package: "swift-testing"),
            ]
        ),
    ]
)
