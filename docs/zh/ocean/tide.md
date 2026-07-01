[English](../../en/ocean/tide.md) | [中文](tide.md) · [← Back](../../../README-zh.md)

# 潮汐

未来10天全球潮汐数据，包括满潮、干潮高度和时间，逐小时潮汐数据。


| 接口代码       | 接口     | 数据类             |
| ----------------------- | ---- | ------------------ |
| oceanTide | 潮汐 | [OceanTideResponse](https://dev.qweather.com/docs/ios-sdk/ocean/ios-tide/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |

## 参数

**OceanParameter**

- `location` ***（必选）*** `String` 需要查询的潮汐站点，请填写潮汐站点的[LocationID](https://dev.qweather.com/docs/resource/glossary/#locationid)，LocationID可通过[POI搜索服务](https://dev.qweather.com/docs/api/geoapi/poi-lookup/)获取。例如 `location=P2951`

- `date` ***（必选）*** 选择日期，最多可选择未来10天（包含今天）的数据。日期格式为yyyyMMdd，例如 `date=20200531`

## 示例代码

**Swift**

```swift
Task{
    do {
        let sevenDaysAfter = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyMMdd"
        let date = formatter.string(from: sevenDaysAfter)
        let parameter = OceanParameter(location: "P2236", date: date)
        let response = try await QWeather.instance
            .oceanTide(parameter)
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
NSDate * sevenDaysAfter = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:7 toDate:[NSDate date] options:0];
NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
[formatter setDateFormat:@"yyyyMMdd"];
NSString * date = [formatter stringFromDate:sevenDaysAfter];
OceanParameter *parameter = [OceanParameter instanceWithLocation:@"P2236" date:date];
[QWeatherObjc oceanTide:parameter completionHandler:^(OceanTideResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## 返回数据

[OceanTideResponse](https://dev.qweather.com/docs/ios-sdk/ocean/ios-tide/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE)