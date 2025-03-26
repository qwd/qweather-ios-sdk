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
                // url: "https://a.hecdn.net/download/api_sdk/QWeather_iOS_SDK_Pub_V4.20.zip",
                // checksum: "007db4a13ec45b7dba2a4bbd50fab30af4210d9af1e3bab97126b55fb485b709"
        )
    ]
)
