// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "QWeatherKit",
    platforms: [
        .iOS(.v15),
        .macOS(.v11),
        .watchOS(.v8),
        .tvOS(.v15),
    ],
    products: [
        .library(
            name: "QWeatherKit",
            targets: ["QWeatherKit"])
    ],
    targets: [
        .binaryTarget(
            name: "QWeatherKit",
            path: "./QWeatherKit.xcframework"
        )
    ]
)
