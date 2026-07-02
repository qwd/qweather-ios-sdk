[English](grid-weather-hourly-forecast.md) | [中文](../../zh/weather/grid-weather-hourly-forecast.md) · [← Back](../../../README.md)

# Grid Weather Hourly Forecast

Weather forecast data based on numerical models, to provide hourly weather forecasts at specified coordinates around the world, with a spatial resolution of 3-5 kilometers.

> **Hint:** The grid weather data is based on Numerical Weather Prediction (NWP) models, and it is not suitable for comparison with observation station data. For station-based city weather data, please refer to the [Weather Hourly Forecast](./weather-hourly-forecast.md). Grid weather uses UTC+0 as the time zone.

| Interface code       | Interface     | Class             |
| --------------------------- | ---- | ------------------ |
| grid24h | Hourly Forecast by Grid (24hrs)| [GridHourlyResponse](https://dev.qweather.com/en/docs/api/weather/grid-weather-hourly-forecast/#response) |
| grid72h | Hourly Forecast by Grid (72hrs)）| [GridHourlyResponse](https://dev.qweather.com/en/docs/api/weather/grid-weather-hourly-forecast/#response) |


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
        * Hourly Forecast by Grid (24hrs)
        */
        let _ = try await QWeather.instance
            .grid24h(parameter)
        
        /*
        * Hourly Forecast by Grid (72hrs)
        */
        let _ = try await QWeather.instance
            .grid72h(parameter)

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

void (^handler)(GridHourlyResponse *, NSError *) = ^(GridHourlyResponse *response,
    NSError *error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
};

/*
* Hourly Forecast by Grid (24hrs)
*/
[QWeatherObjc grid24h:parameter completionHandler:handler];

/*
* Hourly Forecast by Grid (72hrs)
*/
[QWeatherObjc grid72h:parameter completionHandler:handler];
```

## Response

[GridHourlyResponse](https://dev.qweather.com/en/docs/api/weather/grid-weather-hourly-forecast/#response)

