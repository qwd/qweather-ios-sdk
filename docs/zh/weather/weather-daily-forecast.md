[English](../../en/weather/weather-daily-forecast.md) | [中文](weather-daily-forecast.md) · [← Back](../../../README-zh.md)

# 每日天气预报

每日天气预报iOS SDK，提供全球城市未来3-30天天气预报，包括：日出日落、月升月落、最高最低温度、天气白天和夜间状况、风力、风速、风向、相对湿度、大气压强、降水量、露点温度、紫外线强度、能见度等。

| 接口代码     | 接口         | 数据类               |
| ----------- | ------------ | -------------------- |
| weather3d  | 3天预报       | [WeatherDailyResponse](https://dev.qweather.com/docs/ios-sdk/weather/ios-weather-daily-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |
| weather7d  | 7天预报       | [WeatherDailyResponse](https://dev.qweather.com/docs/ios-sdk/weather/ios-weather-daily-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |
| weather10d | 10天预报      | [WeatherDailyResponse](https://dev.qweather.com/docs/ios-sdk/weather/ios-weather-daily-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |
| weather15d | 15天预报      | [WeatherDailyResponse](https://dev.qweather.com/docs/ios-sdk/weather/ios-weather-daily-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |
| weather30d | 30天预报      | [WeatherDailyResponse](https://dev.qweather.com/docs/ios-sdk/weather/ios-weather-daily-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |

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
        
        /*
        * 获取3天预报数据
        */
        let _ = try await QWeather.instance.weather3d(parameter)

        /*
        * 获取7天预报数据
        */
        let _ = try await QWeather.instance.weather7d(parameter)

        /*
        * 获取10天预报数据
        */
        let _ = try await QWeather.instance.weather10d(parameter)
        
        /*
        * 获取15天预报数据
        */
        let _ = try await QWeather.instance.weather15d(parameter)
        
        /*
        * 获取30天预报数据
        */
        let _ = try await QWeather.instance.weather30d(parameter)

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

void (^handler)(WeatherDailyResponse *, NSError *) = ^(WeatherDailyResponse *response,
    NSError *error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
};

/*
* 获取3天预报数据
*/
[QWeatherObjc weather3d:parameter completionHandler:handler];

/*
* 获取7天预报数据
*/
[QWeatherObjc weather7d:parameter completionHandler:handler];

/*
* 获取10天预报数据
*/
[QWeatherObjc weather10d:parameter completionHandler:handler];

/*
* 获取15天预报数据
*/
[QWeatherObjc weather15d:parameter completionHandler:handler];

/*
* 获取30天预报数据
*/
[QWeatherObjc weather30d:parameter completionHandler:handler];
```

## 返回数据

[WeatherDailyResponse](https://dev.qweather.com/docs/ios-sdk/weather/ios-weather-daily-forecast/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE)