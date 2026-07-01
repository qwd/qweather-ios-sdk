[English](../en/config.md) | [中文](config.md) · [← Back](../../README-zh.md)

# 配置

**支持下列操作系统：**

- iOS 15.0+ / macOS 11.0+ / watchOS 8.0+ / tvOS 15.0+ / visionOS 1.0+
- Xcode 26.0 +

## 1、创建项目和凭据

请确保已经创建了[项目和凭据](https://dev.qweather.com/docs/configuration/project-and-key/)，并已了解如何使用 [JWT](https://dev.qweather.com/docs/configuration/authentication/#json-web-token) 身份认证。

## 2、安装SDK

当前iOS SDK的最新版本是`5.2.2`([更新记录](https://github.com/qwd/qweather-ios-sdk/releases))

### Swift Package Manager

- File > Swift Packages > Add Package Dependency
- 添加 `https://github.com/qwd/qweather-ios-sdk.git`
- 选择 `Up to Next Major` 填写 `5.0.0`

[Adding package dependencies to your app](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app)

### CocoaPods

和风天气iOS SDK可以通过[CocoaPods](https://cocoapods.org/)进行安装。CocoaPods是一种开源依赖库管理器，如果你还未安装CocoaPods，请参考[CocoaPods快速开始](https://guides.cocoapods.org/using/getting-started.html)。下列步骤假设你已经完成了CocoaPods的安装和设置。

1. 在项目根目录创建名为`Podfile`的文件
2. 在`Podfile`文件中添加如下内容并保存：
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

3. 打开终端，进入包含`Podfile`的目录输入并运行 `pod install`

### 手动安装

- 下载SDK：[QWeatherSDK 5.2.2](https://github.com/qwd/qweather-ios-sdk/releases/tag/5.2.2)
- 将 `QWeatherSDK.xcframework` 包导入到目标 Target 中

## 3、添加 API Host 和 Token

将代码中的`YOUR_HOST`替换为您的 [API Host](https://dev.qweather.com/docs/configuration/api-host)

***Swift***

```swift
import QWeatherSDK

...

try await QWeather
            .getInstance("{YOUR_HOST}")  // 初始化服务地址
            .setupLogEnable(true)  // 启用调试日志（生产环境建议设置为 false）

```

***Objective-C***

```objc
#import <QWeatherSDK/QWeatherSDK-Swift.h>

...

// 初始化服务地址
[QWeatherObjc initConfigWithHost:@"{YOUR_HOST}"];

// 启用调试日志（生产环境建议设置为 false）
[QWeatherObjc setupLogEnable:YES];
```

**设置Token生成器**

> **提示**：仅支持 [JWT](https://dev.qweather.com/docs/configuration/authentication/#json-web-token) 身份认证。

SDK支持通过 TokenGenerator 和闭包两种机制生成访问令牌，开发者可根据需求任选其一。需注意当同时配置两种方式时，闭包实现将自动失效。出于安全考虑，请确保妥善保管私钥、项目ID及凭据ID等敏感信息，避免以明文形式存储或传输。

***Swift***

```swift
// 通过SDK提供的JWTGenerator设置令牌生成器，其遵从TokenGenerator协议
let jwt = JWTGenerator(privateKey: "{YOUR_PRIVATE_KEY}", // 私钥
                              pid: "{YOUR_PROJECT_ID}", // 项目ID
                              kid: "{YOUR_KID}") // 凭据ID
instance.setupTokenGenerator(jwt)

//NOTE: 开发者也可以通过遵从TokenGenerator协议创建自己的令牌生成器

// 通过闭包设置令牌生成器
instance.setupTokenGenerator({  
    // 生产环境中应在此处实现令牌刷新逻辑，而非硬编码
    return "{YOUR_TOKEN}"  // 返回用于 API 认证的 JWT 令牌
})
```

***Objective-C***

```objc
// 通过SDK提供的方法设置令牌生成器
[QWeatherObjc setupTokenGeneratorWithPrivateKey:@"{YOUR_PRIVATE_KEY}" // 私钥
                                          pid:@"{YOUR_PROJECT_ID}" // 项目ID
                                          kid:@"{YOUR_KID}"]; // 凭据ID


// 通过闭包设置令牌生成器
[QWeatherObjc setupTokenGeneratorWithGenerater:^NSString * _Nonnull{
    // 生产环境中应在此处实现令牌刷新逻辑，而非硬编码
    return @"{YOUR_TOKEN}"; // 返回用于 API 认证的 JWT 令牌
}];
```
