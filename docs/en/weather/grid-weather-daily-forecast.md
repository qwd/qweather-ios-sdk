[English](grid-weather-daily-forecast.md) | [中文](../../zh/weather/grid-weather-daily-forecast.md) · [← Back](../../../README.md)

# Grid Weather Daily Forecast

Weather forecast data based on numerical models, to provide daily weather forecasts at specified coordinates around the world, with a spatial resolution of 3-5 kilometers.

> **Hint:** The grid weather data is based on Numerical Weather Prediction (NWP) models, and it is not suitable for comparison with observation station data. For station-based city weather data, please refer to the [City Weather API](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-daily-forecast/). Grid weather uses UTC+0 as the time zone.

| Interface code    | Interface   | Class           |
| ----------------- | ----------- | --------------- |
| grid3d | 3 Days Forecast by Grid| [GridDailyResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-grid-weather-daily-forecast/#response) |
| grid7d | 7 Days Forecast by Grid| [GridDailyResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-grid-weather-daily-forecast/#response) |


## Parameters

 **GridWeatherParameter**

- `longitude` ***(required)*** `Double` The longitude of the desired location. Decimal format, up to 2 decimal places. For example `116.41`
- `latitude` ***(required)*** `Double` The latitude of the desired location. Decimal format, up to 2 decimal places. For example `39.92`
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.
- `unit` `Unit` Set weather data unit, the available value are `unit=m` for metric(default) and `unit=i` for imperial. See more about [Unit](https://dev.qweather.com/en/docs/resource/unit).

## Sample code

**Swift**

```swift
Task{
    do {
        let parameter = GridWeatherParameter(longitude: 116.41, latitude: 39.92)
        /*
        * 3 Days Forecast by Grid
        */
        let _ = try await QWeather.instance
            .grid3d(parameter)
        
        /*
        * 7 Days Forecast by Grid
        */
        let _ = try await QWeather.instance
            .grid7d(parameter)

    } catch QWeatherError.errorResponse(let error) {
        print(error)
    } catch {
        print(error)
    }
}
```

**Objective-C**

```objc
GridWeatherParameter *parameter = [GridWeatherParameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS) unit:@(UnitMETRIC)];

void (^handler)(GridDailyResponse *, NSError *) = ^(GridDailyResponse *response,
    NSError *error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
};

/*
* 3 Days Forecast by Grid
*/
[QWeatherObjc grid3d:parameter completionHandler:handler];

/*
* 7 Days Forecast by Grid
*/
[QWeatherObjc grid7d:parameter completionHandler:handler];
```

## Response

[GridDailyResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-grid-weather-daily-forecast/#response)
