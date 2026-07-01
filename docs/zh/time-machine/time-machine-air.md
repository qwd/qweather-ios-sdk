[English](../../en/time-machine/time-machine-air.md) | [中文](time-machine-air.md) · [← Back](../../../README-zh.md)

# 历史空气质量

获取最近10天的中国空气质量历史再分析数据。

> 例如今天是12月30日，最多可获取12月20日至12月29日的空气质量历史数据。

| 接口代码        | 接口            | 数据类                 |
| -------------- | -------------- | --------------------- |
| historicalAir | 历史空气质量     | [HistoricalAirResponse](https://dev.qweather.com/docs/ios-sdk/time-machine/ios-time-machine-air/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |

## 参数

**HistoricalAirParameter**

- `location` ***（必选）*** `String` 需要查询的地区，仅支持[LocationID](https://dev.qweather.com/docs/resource/glossary/#locationid)，LocationID可通过[GeoAPI](https://dev.qweather.com/docs/api/geoapi/)获取。例如 `location=101010100`
- `date` ***（必选）*** `String` 选择日期，最多可选择最近10天（不包含今天）的数据。日期格式为yyyyMMdd，例如 `date=20200531`
- `lang` `Lang` 多语言设置，请阅读[多语言](https://dev.qweather.com/docs/resource/language/)文档，了解我们的多语言是如何工作、如何设置以及数据是否支持多语言。

## 示例代码

**Swift**

```swift
Task{
    do {
        let threeDaysAgo = Calendar.current.date(byAdding: .day, value: -3, to: Date())!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyMMdd"
        let date = formatter.string(from: threeDaysAgo)
        let parameter = HistoricalAirParameter(location: "101010100", date: date)
        let response = try await QWeather.instance
            .historicalAir(parameter)
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
NSDate * threeDaysAgo = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:-3 toDate:[NSDate date] options:0];
NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
[formatter setDateFormat:@"yyyyMMdd"];
NSString * date = [formatter stringFromDate:threeDaysAgo];
HistoricalAirParameter *parameter = [HistoricalAirParameter instanceWithLocation:@"101010100" date:date lang:@(LangZH_HANS)];
[QWeatherObjc historicalAir:parameter completionHandler:^(HistoricalAirResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## 返回数据

[HistoricalAirResponse](https://dev.qweather.com/docs/ios-sdk/time-machine/ios-time-machine-air/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) 