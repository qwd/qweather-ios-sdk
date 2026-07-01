[English](weather-hourly-forecast.md) | [中文](../../zh/weather/weather-hourly-forecast.md) · [← Back](../../../README.md)

#  Weather Hourly Forecast

Get hourly weather forecasts for cities around the world for the next 24-168 hours.

| Interface code  | Interface         | Class            |
| --------------- | ----------------- | ---------------- |
| weather24h  | 24-hours forecast  | [WeatherHourlyResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-hourly-forecast/#response) |
| weather72h  | 72-hours forecast  | [WeatherHourlyResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-hourly-forecast/#response)  |
| weather168h | 168-hours forecast | [WeatherHourlyResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-hourly-forecast/#response)  |

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
        /**
        * 24-hours forecast
        */
        let _ = try await QWeather.instance
            .weather24h(parameter)

        /**
        * 72-hours forecast
        */
        let _ = try await QWeather.instance
            .weather72h(parameter)
        
        /**
        * 168-hours forecast
        */
        let _ = try await QWeather.instance
            .weather168h(parameter)

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

    void (^handler)(WeatherHourlyResponse *, NSError *) = ^(WeatherHourlyResponse *response,
    NSError *error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    };

    /**
    * 24-hour forecast data
    */
    [QWeatherObjc weather24h:parameter completionHandler:handler];

    /**
    * 72-hour forecast data
    */
    [QWeatherObjc weather72h:parameter completionHandler:handler];

    /**
    * 168-hour forecast data
    */
    [QWeatherObjc weather168h:parameter completionHandler:handler];
```

## Response

[WeatherHourlyResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-hourly-forecast/#response)
