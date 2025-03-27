// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "QWeatherSDK",
    platforms: [
        .iOS(.v15),
        .macOS(.v11),
        .watchOS(.v8),
        .tvOS(.v15),
    ],
    products: [
        .library(
            name: "QWeatherSDK",
            targets: ["QWeatherSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "QWeatherSDK",
            path: "./QWeatherSDK.xcframework"
        )
    ]
)
