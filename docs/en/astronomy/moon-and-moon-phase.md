[English](moon-and-moon-phase.md) | [中文](../../zh/astronomy/moon-and-moon-phase.md) · [← Back](../../../README.md)

# Moon and Moon Phase 

Get moonrise and moonset and hourly moon phase data for the next 60 days at any location worldwide.

| Interface code              | Interface           | Class        |
| --------------------------- | -------------- | ------------- |
| astronomyMoon | Moon and Moon Phase | [AstronomyMoonResponse](https://dev.qweather.com/en/docs/ios-sdk/astronomy/ios-moon-and-moon-phase/#response) |

## Parameters

**AstronomyMoonParameter**

- `location` ***(required)*** `String` The location to be queried, support [LocationID](https://dev.qweather.com/en/docs/resource/glossary/#locationid) or comma-separated [longitude and latitude](https://dev.qweather.com/en/docs/resource/glossary/#coordinate) (decimal, up to 2 decimal places), LocationID can be obtained by [GeoAPI](https://dev.qweather.com/en/docs/api/geoapi/). Example: `location=101010100` or `location=116.41,39.92`
- `date` ***(required)*** `String` Set the date, up to 60 days in the future (including today). The date format is yyyyMMdd. Example: `date=20200531`
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.

## Sample code

Swift

```swift
Task {
    do {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyMMdd"
        let date = formatter.string(from: Date())
        let parameter = AstronomyMoonParameter(location: "101010100", date: date)
        let response = try await QWeather.instance
            .astronomyMoon(parameter)
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
AstronomyMoonParameter *parameter = [AstronomyMoonParameter instanceWithLocation:@"101010100" date:date lang:@(LangZH_HANS)];
[QWeatherObjc astronomyMoon:parameter completionHandler:^(AstronomyMoonResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[AstronomyMoonResponse](https://dev.qweather.com/en/docs/ios-sdk/astronomy/ios-moon-and-moon-phase/#response)
