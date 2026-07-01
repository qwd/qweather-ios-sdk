[English](weather-daily-forecast.md) | [中文](../../zh/weather/weather-daily-forecast.md) · [← Back](../../../README.md)

# Weather Daily Forecast

Get weather daily forecasts for the next 3-30 days for cities around the world.

| Interface code     | Interface         | Class            |
| ------------------------- | ----------------- | ---------------- |
| weather3d   | 3-days forecast    | [WeatherDailyResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-daily-forecast/#response) |
| weather7d   | 7-days forecast    | [WeatherDailyResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-daily-forecast/#response)  |
| weather10d  | 10-days forecast   | [WeatherDailyResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-daily-forecast/#response)  |
| weather15d  | 15-days forecast   | [WeatherDailyResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-daily-forecast/#response)  |
| weather30d  | 30-days forecast   | [WeatherDailyResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-daily-forecast/#response)  |

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
        * Get 3-days forecast data
        */
        let _ = try await QWeather.instance.weather3d(parameter)

        /*
        * Get 7-days forecast data
        */
        let _ = try await QWeather.instance.weather7d(parameter)

        /**
        * Get 10-days forecast data
        */
        let _ = try await QWeather.instance.weather10d(parameter)
        
        /**
        * Get 15-days forecast data
        */
        let _ = try await QWeather.instance.weather15d(parameter)
        
        /*
        * Get 30-days forecast data
        */
        let _ = try await QWeather.instance.weather30d(parameter)

    } catch QWeatherError.errorResponse(let error) {
        print(error)
    } catch {
        print(error)
    }
}
```

**Objective-C**

```objc
WeatherParameter *parameter = [WeatherParameter instanceWithLocation:@"101010100" lang:@(LangZH_HANS) unit:@(UnitMETRIC)];

void (^handler)(WeatherDailyResponse *, NSError *) = ^(WeatherDailyResponse *response,
    NSError *error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
};

/**
* Get 3-days forecast data
*/
[QWeatherObjc weather3d:parameter completionHandler:handler];

/**
* Get 7-days forecast data
*/
[QWeatherObjc weather7d:parameter completionHandler:handler];

/**
* Get 10-days forecast data
*/
[QWeatherObjc weather10d:parameter completionHandler:handler];

/**
* Get 15-days forecast data
*/
[QWeatherObjc weather15d:parameter completionHandler:handler];

/**
* Get 30-days forecast data
*/
[QWeatherObjc weather30d:parameter completionHandler:handler];
```

## Response

[WeatherDailyResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-daily-forecast/#response) 