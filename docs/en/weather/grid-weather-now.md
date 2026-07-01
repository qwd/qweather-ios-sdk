[English](grid-weather-now.md) | [中文](../../zh/weather/grid-weather-now.md) · [← Back](../../../README.md)

#  Grid Weather Real-time

Weather forecast data based on numerical models, to provide current weather data at specified coordinates around the world, with a spatial resolution of 3-5 kilometers.

> **Hint:** The grid weather data is based on Numerical Weather Prediction (NWP) models, and it is not suitable for comparison with observation station data. For station-based city weather data, please refer to the [City Weather API](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-weather-now/). Grid weather uses UTC+0 as the time zone.

| Interface code          | Interface     | Class            |
| --------------------------- | ---- | ------------------ |
| gridNow |  Grid Weather Real-time| [GridNowResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-grid-weather-now/#response) |


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
        let response = try await QWeather.instance
            .gridNow(parameter)
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
GridWeatherParameter *parameter = [GridWeatherParameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
[QWeatherObjc gridNow:parameter completionHandler:^(GridNowResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[GridNowResponse](https://dev.qweather.com/en/docs/ios-sdk/weather/ios-grid-weather-now/#response)
