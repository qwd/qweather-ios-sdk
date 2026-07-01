[English](weather-now.md) | [中文](../../zh/weather/weather-now.md) · [← Back](../../../README.md)

# Real-time weather

Get real-time weather data for 200,000+ cities around the world, including temperature, wind, humidity, pressure, precipitation, visibility, etc.

| Interface code     | Interface         | Class            |
| ------------------------- | ----------------- | ---------------- |
| weatherNow  | Real-time weather | [WeatherNowResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-now/#response) |

## Parameters

**WeatherParameter**

- `location` ***(required)*** `String` The location to be queried, support [LocationID](https://dev.qweather.com/en/docs/resource/glossary/#locationid) or comma-separated [longitude and latitude](https://dev.qweather.com/en/docs/resource/glossary/#coordinate) (decimal, up to 2 decimal places), LocationID can be obtained by [GeoAPI](https://dev.qweather.com/en/docs/api/geoapi/). Example: `location=101010100` or `location=116.41,39.92`
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.
- `unit` `Unit` Set weather data unit, the available value are `unit=m` for metric(default) and `unit=i` for imperial. See more about [Unit](https://dev.qweather.com/en/docs/resource/unit).

## Sample code

**Swift**

```swift
Task{
    do {
        let parameter = WeatherParameter(location: "101010100")
        let response = try await QWeather.instance
            .weatherNow(parameter)
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
WeatherParameter * parameter = [WeatherParameter instanceWithLocation:@"101010100" lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
[QWeatherObjc weatherNow:parameter completionHandler:^(WeatherNowResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[WeatherNowResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-now/#response)

