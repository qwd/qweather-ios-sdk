[English](../../en/air-quality/air-current.md) | [中文](air-current.md) · [← Back](../../../README-zh.md)


# 实时空气质量

实时空气质量API提供指定地点的实时空气质量数据，精度为1x1公里。

- 基于各个国家或地区当地标准的AQI、AQI等级、颜色和首要污染物
- 和风天气通用AQI
- 污染物浓度值、分指数
- 健康建议
- 相关联的监测站信息

我们推荐阅读[空气质量信息文档](https://dev.qweather.com/docs/resource/air-info/)，以便了解指数类型、污染物、支持的国家等信息。

| 接口代码 | 接口                         | 数据类      |
| --------------- | ---------------------------- | ------------ |
| airCurrent | 实时空气质量    | [AirV1CurrentResponse](https://dev.qweather.com/docs/api/air-quality/air-hourly-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |

## 参数

**AirV1Parameter**

- `latitude` ***（必选）*** `Double` 所需位置的纬度。十进制，最多支持小数点后两位。例如 `39.92`
- `longitude` ***（必选）*** `Double` 所需位置的经度。十进制，最多支持小数点后两位。例如 `116.41`
- `lang` `Lang` 多语言设置，请阅读[多语言](https://dev.qweather.com/docs/resource/language/)文档，了解我们的多语言是如何工作、如何设置以及数据是否支持多语言。

## 示例代码

**Swift**

```swift
Task {
    do {
        let parameter = AirV1Parameter(longitude: 116.41, latitude: 39.92)
        let response = try await QWeather.instance
            .airCurrent(parameter)
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
AirV1Parameter *parameter = [AirV1Parameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS)];
[QWeatherObjc airCurrent:parameter completionHandler:^(AirV1CurrentResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## 返回数据

[AirV1CurrentResponse](https://dev.qweather.com/docs/api/air-quality/air-hourly-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE)