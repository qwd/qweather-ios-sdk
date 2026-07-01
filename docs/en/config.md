[English](config.md) | [中文](../zh/config.md) · [← Back](../../README.md)

# Configuration

**Requirement**

- iOS 15.0+ / macOS 11.0+ / watchOS 8.0+ / tvOS 15.0+ / visionOS 1.0+
- Xcode 26.0 +

## 1. Create project and credential

Make sure you have created a Project and Credential, see [Project and KEY](https://dev.qweather.com/en/docs/configuration/project-and-key/) and [JWT](https://dev.qweather.com/en/docs/configuration/authentication/#json-web-token) authentication.

## 2. Installation

The latest version of iOS SDK is `5.2.2` ([Release note](https://github.com/qwd/qweather-ios-sdk/releases))

### Swift Package Manager

1. File > Swift Packages > Add Package Dependency
2. Add `https://github.com/qwd/qweather-ios-sdk.git`
3. Select `Up to Next Major` with `5.0.0`

[Adding package dependencies to your app](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app)

### CocoaPods

QWeatherSDK can be installed via [CocoaPods](https://cocoapods.org/). CocoaPods is an open source dependency manager, if you haven't installed CocoaPods yet, please refer to [CocoaPods Getting Started guide](https://guides.cocoapods.org/using/getting-started.html). The following steps assume that you have already completed the installation and setup of CocoaPods.

1. Create a file named `Podfile` in your project directory
2. Add the following to the `Podfile` and save it
   - iOS

     ```
     target '{YOUR_iOS_TARGET}' do
        pod 'QWeather-SDK','~> 5.2.2'
     end
     ```

   - macOS

     ```
     target '{YOUR_macOS_TARGET}' do
         pod 'QWeather-SDK','~> 5.2.2'
     end
     ```

3. Open a terminal and go to the directory containing the `Podfile` and run `$ pod install`

### Manual install

- Download SDK: [QWeatherSDK 5.2.2](https://github.com/qwd/qweather-ios-sdk/releases/tag/5.2.2)
- Add `QWeatherSDK.xcframework` to iOS/macOS target.

## 3. Add API Host and token

Replace `YOUR_HOST` with your [API Host](http://dev.qweather.com/en/docs/configuration/api-host/)

***Swift***

```swift
import QWeatherSDK

...

try await QWeather
            .getInstance("{YOUR_HOST}")  // Initialize api host
            .setupLogEnable(true)  // Enable debug logging (set false for production environments)

```

***Objective-C***

```objc
#import <QWeatherSDK/QWeatherSDK-Swift.h>

...

// Initialize api host
[QWeatherObjc initConfigWithHost:@"{YOUR_HOST}"];

// Enable debug logging (set false for production environments)
[QWeatherObjc setupLogEnable:YES];
```

**Set up the token generator**

> **Hint:** iOS SDK only support [JWT](https://dev.qweather.com/docs/configuration/authentication/#json-web-token) for authentication.

The SDK provides two token generation mechanisms: TokenGenerator and closure-based implementation. Developers can choose either approach based on their needs. It is important to note that if both methods are configured simultaneously, the closure implementation will be automatically disabled. For security purposes, please ensure proper management of sensitive information such as private key, project ID, and credential ID, avoiding storage or transmission in plaintext.

***Swift***

```swift
// Configure the token generator using the JWTGenerator class provided by the SDK
let jwt = JWTGenerator(privateKey: "{YOUR_PRIVATE_KEY}", // Pravite Key
                              pid: "{YOUR_PROJECT_ID}", // Project ID
                              kid: "{YOUR_KID}") // Credential ID
instance.setupTokenGenerator(jwt)

//NOTE: Developers can also customize a token generator by conforming to the TokenGenerator protocol.

// Set the token generator via a closure.
instance.setupTokenGenerator({  
     // Update jwt token should be implemented here in production environments
      return "{YOUR_TOKEN}"
})
```

***Objective-C***

```objc
#import <QWeatherSDK/QWeatherSDK-Swift.h>

...

// Initialize api host
[QWeatherObjc initConfigWithHost:@"{YOUR_HOST}"];

// Enable debug logging (set false for production environments)
[QWeatherObjc setupLogEnable:YES];
```
