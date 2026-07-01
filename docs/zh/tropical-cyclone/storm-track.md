[English](../../en/tropical-cyclone/storm-track.md) | [中文](storm-track.md) · [← Back](../../../README-zh.md)

# 台风实况和路径

台风实况和路径提供全球主要海洋流域的台风实时位置、等级、气压、风力、速度以及活跃台风的轨迹路径。

| 接口代码          | 接口           | 数据类                |
| ---------------- | -------------- | ------------------- |
| tropicalStormTrack | 台风实况和路径   | [StormTrackResponse](https://dev.qweather.com/docs/ios-sdk/tropical-cyclone/ios-storm-track/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |

## 参数

**StormParameter**

- `stormid` ***（必选）*** `String` 需要查询的台风ID，StormID可通过[台风列表](#storm-list)获取。例如 `stormid=NP2018`

## 示例代码

**Swift**

```swift
Task{
    do {
        let parameter = StormParameter(stormid: "NP_2421")
        let response = try await QWeather.instance
            .tropicalStormTrack(parameter)
        print(response)
    } catch QWeatherError.errorResponse(let error) {
        print(error)
    } catch {
        print(error)
    }
}
```

**Objective-C**

```objc
StormParameter *parameter = [StormParameter instanceWithStormid:@"NP_2421"];
[QWeatherObjc tropicalStormTrack:parameter completionHandler:^(StormTrackResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```
     
## 返回数据

[StormTrackResponse](https://dev.qweather.com/docs/ios-sdk/tropical-cyclone/ios-storm-track/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE)

[台风等级](https://dev.qweather.com/docs/ios-sdk/tropical-cyclone/ios-storm-track/#%E5%8F%B0%E9%A3%8E%E7%AD%89%E7%BA%A7)