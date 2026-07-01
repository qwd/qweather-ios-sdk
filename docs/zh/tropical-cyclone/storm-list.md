[English](../../en/tropical-cyclone/storm-list.md) | [中文](storm-list.md) · [← Back](../../../README-zh.md)

# 台风列表

台风列表提供全球主要海洋流域最近2年的台风列表。

> 目前仅支持中国沿海地区，即`basin=NP`

| 接口代码        | 接口     | 数据类             |
| ------------------- | -------- | ---------------- |
| tropicalStormList | 台风列表 | [StormListResponse](https://dev.qweather.com/docs/ios-sdk/tropical-cyclone/ios-storm-list/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |

## 参数

**StormListParameter**

- `basin` ***（必选）*** `Basin` 需要查询的台风所在的流域，例如中国处于西北太平洋，即 `basin=NP`。当前仅支持`NP`。 
   - `AL` North Atlantic 北大西洋 
   - `EP` Eastern Pacific 东太平洋 
   - `NP` NorthWest Pacific 西北太平洋 
   - `SP` SouthWestern Pacific 西南太平洋 
   - `NI` North Indian 北印度洋 
   - `SI` South Indian 南印度洋

- `year` ***（必选）*** `String` 支持查询本年度和上一年度的台风，例如：`year=2020`, `year=2019`


## 示例代码

**Swift**

```swift
Task{
    do {
        let parameter = StormListParameter(basin: .NP, year: 2024)
        let response = try await QWeather.instance
            .tropicalStormList(parameter)
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
StormListParameter *parameter = [StormListParameter instanceWithBasin:BasinNP year:2024];
[QWeatherObjc tropicalStormList:parameter completionHandler:^(StormListResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```
     
## 返回数据

[StormListResponse](https://dev.qweather.com/docs/ios-sdk/tropical-cyclone/ios-storm-list/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE)

