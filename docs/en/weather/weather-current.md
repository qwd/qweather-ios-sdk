[English](weather-current.md) | [中文](../../zh/weather/weather-current.md) · [← Back](../../../README.md)

# Current Weather

Returns current weather data for the specified latitude and longitude, with 1-kilometer resolution, global coverage, and minute-level updates.

The response includes weather condition, temperature, feels-like temperature, relative humidity, wind direction and speed, wind gust, precipitation amount, mean sea-level pressure, visibility, dew point, cloud cover, UV index, and more.



| Interface code  | Interface         | Class            |
| ------------ | ------------- | ---------------- |
| weatherCurrent  | Current Weather     | [WeatherCurrentResponse](https://dev.qweather.com/en/docs/api/weather/weather-current/#response) |

## Parameters

**WeatherCurrentParameter**

- `longitude` ***(required)*** `Double` The longitude of the desired location. Decimal format, up to 2 decimal places. For example `116.41`
- `latitude` ***(required)*** `Double` The latitude of the desired location. Decimal format, up to 2 decimal places. For example `39.92`
- `localTime` `Bool` Whether to return the local time of the queried location. `true` for local time, `false` for UTC time (default).
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.

## Sample code

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

## Response

[WeatherCurrentResponse](https://dev.qweather.com/en/docs/api/weather/weather-current/#response)