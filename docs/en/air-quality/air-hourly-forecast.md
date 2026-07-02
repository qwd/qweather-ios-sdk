[English](air-hourly-forecast.md) | [中文](../../zh/air-quality/air-hourly-forecast.md) · [← Back](../../../README.md)

# Air quality hourly forecast

The air quality hourly forecast API provides air quality forecast data for each hour of the next 24 hours, including AQI, pollutants concentration, sub-indexes, health effects and advice.

We recommend to read [Air Quality Info](https://dev.qweather.com/en/docs/resource/air-info/) to learn about the AQIs, pollutants, supported regions and more.

| Interface code | Interface                 | Class       |
| --------------- | ---------------------------- | ------------ |
| airHourly | Air quality hourly forecast    | [AirV1HourlyResponse](https://dev.qweather.com/en/docs/api/air-quality/air-hourly-forecast/#response) |

## Parameters

**AirV1Parameter**

- `latitude` ***(required)*** `Double` The latitude of the desired location. Decimal format, up to 2 decimal places. For example `39.92`

- `longitude` ***(required)*** `Double` The longitude of the desired location. Decimal format, up to 2 decimal places. For example `116.41`

- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.

## Sample code

**Swift**

```swift
Task {
    do {
        let parameter = AirV1Parameter(longitude: 116.41, latitude: 39.92)
        let response = try await QWeather.instance
            .airHourly(parameter)
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
AirV1Parameter *parameter = [AirV1Parameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS)];
[QWeatherObjc airHourly:parameter completionHandler:^(AirV1HourlyResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[AirV1HourlyResponse](https://dev.qweather.com/en/docs/api/air-quality/air-hourly-forecast/#response)

