[English](../../en/air-quality/air-station.md) | [中文](air-station.md) · [← Back](../../../README-zh.md)

# 监测站数据

监测站数据API提供各个国家或地区监测站的污染物浓度值。

> **警告：**监测站的观测值仅供参考，可能由于故障、移除、维护或当地法律法规等各种原因导致数据延迟或缺失，我们无法确保该数据的可用性。


| 接口代码 | 接口         | 数据类        |
| --------------- | ---------------- | ------------ |
| airStation | 监测站数据  | [AirV1StationResponse](https://dev.qweather.com/docs/api/air-quality/air-station/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |

## 参数

**AirV1StationParameter**

- `LocationID` ***（必选）*** `String` 空气质量监测站的LocationID，LocationID可通过[GeoAPI](https://dev.qweather.com/docs/api/geoapi/)获取。例如 `P58911`
- `lang` `Lang` 多语言设置，请阅读[多语言](https://dev.qweather.com/docs/resource/language/)文档，了解我们的多语言是如何工作、如何设置以及数据是否支持多语言。

## 示例代码

**Swift**

```swift
Task{
    do {
        let parameter = AirV1StationParameter(locationID: "P58911")
        let response = try await QWeather.instance
            .airStation(parameter)
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
AirV1StationParameter * parameter = [AirV1StationParameter instanceWithLocationID:@"P58911" lang:@(LangZH_HANS)];
    [QWeatherObjc airStation:parameter completionHandler:^(AirV1StationResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
```

## 返回数据

[AirV1StationResponse](https://dev.qweather.com/docs/api/air-quality/air-station/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE)