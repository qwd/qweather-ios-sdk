[English](../../en/weather/grid-weather-hourly-forecast.md) | [中文](grid-weather-hourly-forecast.md) · [← Back](../../../README-zh.md)

# 格点逐小时天气预报

基于数值模式的天气预报数据，提供全球指定坐标的逐小时天气预报，分辨率3-5公里。

> **提示：** 格点天气预报是基于数值预报模型生成，不适宜与观测站数据对比。如需基于观测站的城市天气，请使用[城市逐小时天气](./weather-hourly-forecast.md)。格点天气采用UTC 0时区表示时间。

| 接口代码           | 接口     | 数据类             |
| --------------------------- | ---- | ------------------ |
| grid24h | 逐小时预报（未来24小时）| [GridHourlyResponse](https://dev.qweather.com/docs/ios-sdk/weather/ios-grid-weather-hourly-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |
| grid72h | 逐小时预报（未来72小时）| [GridHourlyResponse](https://dev.qweather.com/docs/ios-sdk/weather/ios-grid-weather-hourly-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |


## 参数

**GridWeatherParameter**

- `latitude` ***（必选）*** `Double` 所需位置的纬度。十进制，最多支持小数点后两位。例如 `39.92`
- `longitude` ***（必选）*** `Double` 所需位置的经度。十进制，最多支持小数点后两位。例如 `116.41`
- `lang` `Lang` 多语言设置，请阅读[多语言](https://dev.qweather.com/docs/resource/language/)文档，了解我们的多语言是如何工作、如何设置以及数据是否支持多语言。
- `unit` `Unit` 数据单位设置，可选值包括`unit=m`（公制单位，默认）和`unit=i`（英制单位）。更多选项和说明参考[度量衡单位](https://dev.qweather.com/docs/resource/unit)。

## 示例代码

**Swift**

```swift
Task{
    do {
        let parameter = GridWeatherParameter(longitude: 116.41, latitude: 39.92)
        /*
        * 逐小时预报（未来24小时）
        */
        let _ = try await QWeather.instance
            .grid24h(parameter)
        
        /*
        * 逐小时预报（未来72小时）
        */
        let _ = try await QWeather.instance
            .grid72h(parameter)

    } catch QWeatherError.errorResponse(let error) {
        print(error)
    } catch {
        print(error)
    }
}
```

**Objective-C**

```objc
GridWeatherParameter *parameter = [GridWeatherParameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS) unit:@(UnitMETRIC)];

void (^handler)(GridHourlyResponse *, NSError *) = ^(GridHourlyResponse *response,
    NSError *error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
};

/*
* 逐小时预报（未来24小时）
*/
[QWeatherObjc grid24h:parameter completionHandler:handler];

/*
* 逐小时预报（未来72小时）
*/
[QWeatherObjc grid72h:parameter completionHandler:handler];
```

## 返回数据

[GridHourlyResponse](https://dev.qweather.com/docs/ios-sdk/weather/ios-grid-weather-hourly-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE)
