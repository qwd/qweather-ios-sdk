[English](../../en/weather/weather-hourly-forecast.md) | [中文](weather-hourly-forecast.md) · [← Back](../../../README-zh.md)

# 逐小时天气预报

逐小时天气预报iOS SDK，提供全球城市未来24-168小时逐小时天气预报，包括：温度、天气状况、风力、风速、风向、相对湿度、大气压强、降水概率、露点温度、云量。

| 接口代码      | 接口          | 数据类           |
| ------------ | ------------ | ---------------- |
| weather24h  | 24小时预报况  | [WeatherHourlyResponse](https://dev.qweather.com/docs/api/weather/weather-hourly-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |
| weather72h  | 72小时预报况  | [WeatherHourlyResponse](https://dev.qweather.com/docs/api/weather/weather-hourly-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |
| weather168h | 168小时预报况 | [WeatherHourlyResponse](https://dev.qweather.com/docs/api/weather/weather-hourly-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |

## 参数

**WeatherParameter**

- `location` ***（必选）*** `String` 需要查询地区的[LocationID](https://dev.qweather.com/docs/resource/glossary/#locationid)或以英文逗号分隔的[经度,纬度坐标](https://dev.qweather.com/docs/resource/glossary/#coordinate)（十进制，最多支持小数点后两位），LocationID可通过[GeoAPI](https://dev.qweather.com/docs/api/geoapi/)获取。例如 `location=101010100` 或 `location=116.41,39.92`
- `lang` `Lang` 多语言设置，请阅读[多语言](https://dev.qweather.com/docs/resource/language/)文档，了解我们的多语言是如何工作、如何设置以及数据是否支持多语言。
- `unit` `Unit` 数据单位设置，可选值包括`unit=m`（公制单位，默认）和`unit=i`（英制单位）。更多选项和说明参考[度量衡单位](https://dev.qweather.com/docs/resource/unit)。

## 示例代码

**Swift**

```swift
Task{
    do {
        let parameter = WeatherParameter(location: "101010100")
        /**
        * 获取24小时预报数据
        */
        let _ = try await QWeather.instance
            .weather24h(parameter)

        /**
        * 获取72小时预报数据
        */
        let _ = try await QWeather.instance
            .weather72h(parameter)
        
        /**
        * 获取168小时预报数据
        */
        let _ = try await QWeather.instance
            .weather168h(parameter)

    } catch QWeatherError.errorResponse(let error) {
        print(error)
    } catch {
        print(error)
    }
}
```

**Objective-C**

```objc
WeatherParameter * parameter = [WeatherParameter instanceWithLocation:@"101010100" lang:@(LangZH_HANS) unit:@(UnitMETRIC)];

void (^handler)(WeatherHourlyResponse *, NSError *) = ^(WeatherHourlyResponse *response,
    NSError *error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
};

/**
    * 获取24小时预报数据
    */
[QWeatherObjc weather24h:parameter completionHandler:handler];

/**
    * 获取72小时预报数据
    */
[QWeatherObjc weather72h:parameter completionHandler:handler];

/**
    * 获取168小时预报数据
    */
[QWeatherObjc weather168h:parameter completionHandler:handler];
```

## 返回数据

[WeatherHourlyResponse](https://dev.qweather.com/docs/api/weather/weather-hourly-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE)