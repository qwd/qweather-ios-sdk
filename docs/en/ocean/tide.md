[English](tide.md) | [中文](../../zh/ocean/tide.md) · [← Back](../../../README.md)

# Tide

Global tidal data for the next 10 days, including tide table and hourly tide forecast data.

| Interface code        | Interface     | Class             |
| ----------------------- | ---- | ------------------ |
| oceanTide | Tide | [OceanTideResponse](https://dev.qweather.com/en/docs/ios-sdk/ocean/ios-tide/#response) |

## Parameters

**OceanParameter**

- `location` ***(required)*** `String` The tide station to be queried, need [LocationID](https://dev.qweather.com/en/docs/resource/glossary/#locationid) and LocationID can be obtained by [POI Lookup](https://dev.qweather.com/en/docs/api/geoapi/poi-lookup/).   For example: `location=P2951`
- `date` ***(required)*** Set the date, up to 10 days in the future (including today). The date format is yyyyMMdd. Eexample: `date=20200531`

## Sample code

Swift

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

Objective-C

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

## Response

[OceanTideResponse](https://dev.qweather.com/en/docs/ios-sdk/ocean/ios-tide/#response)

