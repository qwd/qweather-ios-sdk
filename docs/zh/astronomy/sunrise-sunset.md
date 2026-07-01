[English](../../en/astronomy/sunrise-sunset.md) | [中文](sunrise-sunset.md) · [← Back](../../../README-zh.md)

# 日出日落

获取未来60天全球任意地点日出日落时间。

> 在[逐天预报API](../weather/weather-daily-forecast.md)中，也会返回对应天数的日出日落、月升月落和月相数据

| 接口代码           | 接口     | 数据类       |
| -------------------------- | -------- | ------------ |
| astronomySun | 日出日落 | [AstronomySunResponse](https://dev.qweather.com/docs/ios-sdk/astronomy/ios-sunrise-sunset/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |

## 参数

**AstronomySunParameter**

- `location` ***（必选）*** `String` 需要查询地区的[LocationID](https://dev.qweather.com/docs/resource/glossary/#locationid)或以英文逗号分隔的[经度,纬度坐标](https://dev.qweather.com/docs/resource/glossary/#coordinate)（十进制，最多支持小数点后两位），LocationID可通过[GeoAPI](https://dev.qweather.com/docs/api/geoapi/)获取。例如 `location=101010100` 或 `location=116.41,39.92`

- `date` ***（必选）*** `String` 选择日期，最多可选择未来60天（包含今天）的数据。日期格式为yyyyMMdd，例如 `date=20200531`

## 示例代码

**Swift**

```swift
Task {
    do {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyMMdd"
        let date = formatter.string(from: Date())
        let parameter = AstronomySunParameter(location: "101010100", date: date)
        let response = try await QWeather.instance
            .astronomySun(parameter)
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
NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
[formatter setDateFormat:@"yyyyMMdd"];
NSString * date = [formatter stringFromDate:[NSDate date]];
AstronomySunParameter *parameter = [AstronomySunParameter instanceWithLocation:@"101010100" date:date];

[QWeatherObjc astronomySun:parameter completionHandler:^(AstronomySunResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## 返回数据

[AstronomySunResponse](https://dev.qweather.com/docs/ios-sdk/astronomy/ios-sunrise-sunset/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) 