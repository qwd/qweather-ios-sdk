[English](weather-hourly-forecast.md) | [中文](../../zh/weather/weather-hourly-forecast.md) · [← Back](../../../README.md)

# Hourly Forecast

Returns an hourly weather forecast for the specified latitude and longitude for up to 240 hours, with 1-kilometer resolution and global coverage.

The response includes weather condition, temperature, feels-like temperature, relative humidity, wind direction and speed, wind gust, precipitation amount and probability, mean sea-level pressure, visibility, dew point, cloud cover, UV index, and more.


| Interface code  | Interface         | Class            |
| ------------ | ------------- | ---------------- |
| weatherHourly  |   Hourly Forecast   | [WeatherForecastHourlyResponse](https://dev.qweather.com/en/docs/api/weather/weather-hourly-forecast/#response) |

## Parameters

**WeatherHourlyParameter**

- `longitude` ***(required)*** `Double` The longitude of the desired location. Decimal format, up to 2 decimal places. For example `116.41`
- `latitude` ***(required)*** `Double` The latitude of the desired location. Decimal format, up to 2 decimal places. For example `39.92`
- `hours` `Int` Number of forecast hours. Value range: `[1, 240]`. Default: `24`
- `localTime` `Bool` Whether to return the local time of the queried location. `true` for local time, `false` for UTC time (default).
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.

## Sample code

**Swift**

```swift
Task{
    do {
        let parameter = WeatherHourlyParameter(longitude: -111.30, latitude: 33.72)
            .setHours(12)
            .setLocalTime(false)
            .setLang(.ZH_HANS)
        let response:WeatherForecastHourlyResponse = try await Q.weatherHourly(parameter)
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
WeatherHourlyParameter * parameter =[WeatherHourlyParameter instanceWithLongitude:116.41 latitude:39.92];
parameter = [parameter setHours:24];
parameter = [parameter setLocalTime:YES];
parameter = [parameter setLang: LangZH_HANS];
[QWeatherObjc weatherHourly:parameter completionHandler:^(WeatherForecastHourlyResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[WeatherForecastHourlyResponse](https://dev.qweather.com/en/docs/api/weather/weather-hourly-forecast/#response)