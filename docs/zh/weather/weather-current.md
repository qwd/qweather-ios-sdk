[English](../../en/weather/weather-current.md) | [中文](weather-current.md) · [← Back](../../../README-zh.md)

# 实时天气

获取指定经纬度位置的实时天气数据，1公里分辨率，覆盖全球任意地点，分钟级更新。

实时天气包括：天气现象、温度、体感温度、相对湿度、风向和风速、阵风风速、降水量、海平面气压、能见度、露点温度、云量、紫外线指数等。


| 接口代码      | 接口          | 数据类           |
| ------------ | ------------- | ---------------- |
| weatherCurrent  | 实时天气      | [WeatherCurrentResponse](https://dev.qweather.com/docs/api/weather/weather-current/#response) |

## 参数

**WeatherCurrentParameter**

- `latitude` ***（必选）*** `Double` 所需位置的纬度。十进制，最多支持小数点后两位。例如 `39.92`
- `longitude` ***（必选）*** `Double` 所需位置的经度。十进制，最多支持小数点后两位。例如 `116.41`
- `localTime` `Bool` 是否返回查询地点的本地时间。`true` 返回本地时间，`false` 返回UTC时间（默认）。
- `lang` `Lang` 多语言设置，请阅读[多语言](https://dev.qweather.com/docs/resource/language/)文档，了解我们的多语言是如何工作、如何设置以及数据是否支持多语言。

## 示例代码

**Swift**

```swift
Task{
    do {
        let parameter = WeatherCurrentParameter(longitude: 116.41, latitude: 39.92)
                .setLocalTime(true)
                .setLang(.ZH_HANS)
        let response:WeatherCurrentResponse = try await Q.weatherCurrent(parameter)
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
WeatherCurrentParameter * parameter = [WeatherCurrentParameter instanceWithLongitude:116.41 latitude:39.92];
parameter = [parameter setLocalTime:YES];
parameter = [parameter setLang: LangZH_HANS];
[QWeatherObjc weatherCurrent:parameter completionHandler:^(WeatherCurrentResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## 返回数据

[WeatherCurrentResponse](https://dev.qweather.com/docs/api/weather/weather-current/#response)