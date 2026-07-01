[English](sunrise-sunset.md) | [中文](../../zh/astronomy/sunrise-sunset.md) · [← Back](../../../README.md)

# Sunrise and Sunset

Get the sunrise and sunset times for any location around the world for the next 60 days.


| Interface code            | Interface     | Class       |
| -------------------------- | -------- | ------------ |
| astronomySun | Sunrise and Sunset | [AstronomySunResponse](https://dev.qweather.com/en/docs/ios-sdk/astronomy/ios-sunrise-sunset/#response) |

## Parameters

**AstronomySunParameter**

- `location` ***(required)*** `String` The location to be queried, support [LocationID](https://dev.qweather.com/en/docs/resource/glossary/#locationid) or comma-separated [longitude and latitude](https://dev.qweather.com/en/docs/resource/glossary/#coordinate) (decimal, up to 2 decimal places), LocationID can be obtained by [GeoAPI](https://dev.qweather.com/en/docs/api/geoapi/). Example: `location=101010100` or `location=116.41,39.92`
- `date` ***(required)*** `String` Set the date, up to 60 days in the future (including today). The date format is yyyyMMdd. Example: `date=20200531`

## Sample code

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
     
## Response

[AstronomySunResponse](https://dev.qweather.com/en/docs/ios-sdk/astronomy/ios-sunrise-sunset/#response)
