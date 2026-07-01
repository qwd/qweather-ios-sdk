[English](solar-elevation-angle.md) | [中文](../../zh/astronomy/solar-elevation-angle.md) · [← Back](../../../README.md)

# Solar Elevation Angle


Get global solar elevation angle and azimuth.


| Interface code                   | Interface       | Class            |
| -------------------------------- | ---------- | ----------------- |
| astronomySolarElevationAngle | Solar elevation angle data | [AstronomySolarElevationAngleResponse](https://dev.qweather.com/en/docs/ios-sdk/astronomy/ios-solar-elevation-angle/#response) |

## Parameters

**SolarElevationAngleParameter**
- `location` ***(required)*** `String` The comma-separated [longitude and latitude](https://dev.qweather.com/en/docs/resource/glossary/#coordinate) (decimal, up to 2 decimal places) of the location to be queried.  For example: `location=116.41,39.92`
- `date` ***(required)*** `String` Set date, format is yyyyMMdd, e.g., `date=20200531`
- `time` ***(required)*** `String` Set time, format is HHmm, 24-hour, e.g., `time=1230`
- `tz` ***(required)*** `String` Location time zone, e.g., `tz=0800` or `tz=-0530`
- `alt` ***(required)*** `Int` Location altitude, in meters, e.g., `alt=43`

## Sample code

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
        
        let parameter = SolarElevationAngleParameter(location: "116.41,39.92", date: date, time: time, tz: "0800", alt: "43")
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

## Response

[AstronomySolarElevationAngleResponse](https://dev.qweather.com/en/docs/ios-sdk/astronomy/ios-solar-elevation-angle/#response)