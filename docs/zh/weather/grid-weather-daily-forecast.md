[English](../../en/weather/grid-weather-daily-forecast.md) | [中文](grid-weather-daily-forecast.md) · [← Back](../../../README-zh.md)

# 格点每日天气预报

基于数值模式的天气预报数据，提供全球指定坐标的每日天气预报，分辨率3-5公里。

> **提示：** 格点天气预报是基于数值预报模型生成，不适宜与观测站数据对比。如需基于观测站的城市天气，请使用[每日天气预报](./weather-daily-forecast.md)。格点天气采用UTC 0时区表示时间。

| 接口代码            | 接口     | 数据类             |
| ----------------- | ---- | ------------------ |
| grid3d | 格点3天预报| [GridDailyResponse](https://dev.qweather.com/docs/api/weather/grid-weather-now/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |
| grid7d | 格点7天预报| [GridDailyResponse](https://dev.qweather.com/docs/api/weather/grid-weather-now/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |


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
        * 格点3天预报
        */
        let _ = try await QWeather.instance
            .grid3d(parameter)
        
        /*
        * 格点7天预报
        */
        let _ = try await QWeather.instance
            .grid7d(parameter)

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

void (^handler)(GridDailyResponse *, NSError *) = ^(GridDailyResponse *response,
    NSError *error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
};

/*
* 格点3天预报
*/
[QWeatherObjc grid3d:parameter completionHandler:handler];

/*
* 格点7天预报
*/
[QWeatherObjc grid7d:parameter completionHandler:handler];
```

## 返回数据

[GridDailyResponse](https://dev.qweather.com/docs/api/weather/grid-weather-now/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE)
