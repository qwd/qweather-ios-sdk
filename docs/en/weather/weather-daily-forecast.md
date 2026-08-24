[English](weather-daily-forecast.md) | [中文](../../zh/weather/weather-daily-forecast.md) · [← Back](../../../README.md)

# Daily Weather

Returns a daily weather forecast for the specified latitude and longitude for up to 10 days, with 1-kilometer resolution and global coverage.

The response provides daytime [07:00, 19:00) and nighttime [19:00, 07:00 the following day) forecasts, including maximum and minimum temperature, weather condition, maximum wind gust, maximum UV index, precipitation amount and probability, mean sea-level pressure, humidity, wind direction and speed, cloud cover, sunrise and sunset, moonrise and moonset, moon phase, and more.


| Interface code  | Interface         | Class            |
| ------------ | ------------- | ---------------- |
| weatherDaily  | Daily Weather     | [WeatherForecastDailyResponse](https://dev.qweather.com/en/docs/api/weather/weather-daily-forecast/#response) |

## Parameters

**WeatherDailyParameter**

- `longitude` ***(required)*** `Double` The longitude of the desired location. Decimal format, up to 2 decimal places. For example `116.41`
- `latitude` ***(required)*** `Double` The latitude of the desired location. Decimal format, up to 2 decimal places. For example `39.92`
- `days` `Int` Number of forecast days. Value range: `1 - 10`, default: `7`
- `localTime` `Bool` Whether to return the local time of the queried location. `true` for local time, `false` for UTC time (default).
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.

## Sample code

**Swift**

```swift
Task{
   do {
        let parameter = WeatherDailyParameter(longitude: 119.76, latitude: -13.17)
            .setDays(7)
            .setLocalTime(true)
            .setLang(.ZH_HANS)
        let response:WeatherForecastDailyResponse = try await Q.weatherDaily(parameter)
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
WeatherDailyParameter * parameter = [WeatherDailyParameter instanceWithLongitude:116.41 latitude:39.92];
parameter = [parameter setDays:7];
parameter = [parameter setLocalTime:YES];
parameter = [parameter setLang: LangZH_HANS];
[QWeatherObjc weatherDaily:parameter completionHandler:^(WeatherForecastDailyResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[WeatherForecastDailyResponse](https://dev.qweather.com/en/docs/api/weather/weather-daily-forecast/#response)