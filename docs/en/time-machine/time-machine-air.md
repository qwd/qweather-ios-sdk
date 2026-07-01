[English](time-machine-air.md) | [中文](../../zh/time-machine/time-machine-air.md) · [← Back](../../../README.md)

# Historical air quality

Get the last 10 days of air quality history data.

> Let's say, today is December 30, you can get data from Dec. 20 to Dec. 29.

| Interface code     | Interface              | Class                      |
| ------------------ | ---------------------- | -------------------------- |
| historicalAir     | Historical air quality | [HistoricalAirResponse](https://dev.qweather.com/en/docs/ios-sdk/time-machine/ios-time-machine-weather/#response)      |

## Parameters

**HistoricalAirParameter**

- `location` ***(required)*** `String` The location to be queried, only support [LocationID](https://dev.qweather.com/en/docs/resource/glossary/#locationid) and LocationID can be obtained by [GeoAPI](https://dev.qweather.com/en/docs/api/geoapi/).   For example: `location=101010100`
- `date` ***(required)*** `String` Set the date, up to the most recent 10 days. The date format is yyyyMMdd. Example: `date=20200531`
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.

## Sample code

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

## Response

[HistoricalAirResponse](https://dev.qweather.com/en/docs/ios-sdk/time-machine/ios-time-machine-weather/#response) 
