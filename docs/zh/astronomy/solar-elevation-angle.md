[English](../../en/astronomy/solar-elevation-angle.md) | [中文](solar-elevation-angle.md) · [← Back](../../../README-zh.md)

# 太阳高度角

任意时间点的全球太阳高度及方位角。

| 接口代码                 | 接口       | 数据类            |
| -------------------------------- | ---------- | ----------------- |
| astronomySolarElevationAngle | 太阳高度角 | [AstronomySolarElevationAngleResponse](https://dev.qweather.com/docs/api/astronomy/solar-elevation-angle/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |

## 参数

**SolarElevationAngleParameter**

- `location` ***（必选）*** `String` 需要查询地区的以英文逗号分隔的[经度,纬度坐标](https://dev.qweather.com/docs/resource/glossary/#coordinate)（十进制，最多支持小数点后两位）。例如 `location=116.41,39.92`
- `date` ***（必选）*** `String` 查询日期，格式为yyyyMMdd，例如 `date=20170809`
- `time` ***（必选）*** `String` 查询时间，格式为HHmm，24时制，例如 `time=1230`
- `tz` ***（必选）*** `String` 查询地区所在时区，例如`tz=0800`或`tz=-0530`
- `alt` ***（必选）*** `Int` 海拔高度，单位为米，例如`alt=43`

## 示例代码

**Swift**

```swift
Task {
    do {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyMMdd"
        let date = dateFormatter.string(from: currentDate)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HHmm"
        timeFormatter.locale = Locale(identifier: "en_US_POSIX")
        let time = timeFormatter.string(from: currentDate)
        
        let parameter = SolarElevationAngleParameter(location: "101010100", date: date, time: time, tz: "0800", alt: "43")
        let response = try await QWeather.instance
            .astronomySolarElevationAngle(parameter)
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
NSDate * current = [NSDate date];
NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
[formatter setDateFormat:@"yyyyMMdd"];
NSString * date = [formatter stringFromDate:current];

NSDateFormatter * timeFormatter = [[NSDateFormatter alloc] init];
[timeFormatter setDateFormat:@"yyyyMMdd"];
[timeFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
NSString * time = [formatter stringFromDate:current];

SolarElevationAngleParameter *parameter = [SolarElevationAngleParameter instanceWithLocation:@"116.41,39.92" date:date time:time tz:@"0800" alt:@"43"];

[QWeatherObjc astronomySolarElevationAngle:parameter completionHandler:^(AstronomySolarElevationAngleResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## 返回数据

[AstronomySolarElevationAngleResponse](https://dev.qweather.com/docs/api/astronomy/solar-elevation-angle/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE)
