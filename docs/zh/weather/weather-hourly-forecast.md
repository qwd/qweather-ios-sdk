[English](../../en/weather/weather-hourly-forecast.md) | [中文](weather-hourly-forecast.md) · [← Back](../../../README-zh.md)

# 小时天气预报

获取指定经纬度位置的每日天气预报，最多10天预报，1公里分辨率，覆盖全球任意地点。

每日预报提供白天 [07:00, 19:00)、晚间 [19:00, 次日07:00) 的预报数据，包括：最高和最低温度、天气现象、最大阵风、最大紫外线指数、降水量和概率、海平面气压、湿度、风向和风速、云量、日出日落、月升月落和月相等。


| 接口代码      | 接口          | 数据类           |
| ------------ | ------------- | ---------------- |
| weatherHourly  |   小时天气预报   | [WeatherForecastHourlyResponse](https://dev.qweather.com/docs/api/weather/weather-hourly-forecast/#response) |

## 参数

**WeatherHourlyParameter**

- `latitude` ***（必选）*** `Double` 所需位置的纬度。十进制，最多支持小数点后两位。例如 `39.92`
- `longitude` ***（必选）*** `Double` 所需位置的经度。十进制，最多支持小数点后两位。例如 `116.41`
- `hours` `Int` 预报小时数，支持 `1-240` 小时，默认返回 `24` 小时
- `localTime` `Bool` 是否返回查询地点的本地时间。`true` 返回本地时间，`false` 返回UTC时间（默认）
- `lang` `Lang` 多语言设置，请阅读[多语言](https://dev.qweather.com/docs/resource/language/)文档，了解我们的多语言是如何工作、如何设置以及数据是否支持多语言。

## 示例代码

**Swift**

```swift
Task{
    do {
        let parameter = WeatherHourlyParameter(longitude: -111.30, latitude: 33.72)
            .setHours(12)
            .setLocalTime(true)
            .setLang(.ZH_HANS)
        let response:WeatherForecastHourlyResponse = try await Q.weatherHourly(parameter)
        print(response)
    } catch QWeatherError.errorResponse(let error) {
        assert(false, error.description)
    } catch {
        assert(false, error.localizedDescription)
    }
}
```

**Objective-C**

```objc
WeatherHourlyParameter * parameter =[WeatherHourlyParameter instanceWithLongitude:116.41 latitude:39.92];
parameter = [parameter setHours:12];
parameter = [parameter setLocalTime:YES];
parameter = [parameter setLang: LangZH_HANS];
[QWeatherObjc weatherHourly:parameter completionHandler:^(WeatherForecastHourlyResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## 返回数据

[WeatherForecastHourlyResponse](https://dev.qweather.com/docs/api/weather/weather-hourly-forecast/#response)