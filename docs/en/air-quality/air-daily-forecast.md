[English](air-daily-forecast.md) | [中文](../../zh/air-quality/air-daily-forecast.md) · [← Back](../../../README.md)

# Air quality daily forecast

Air quality (AQI) dailay forecasts, pollutants, and health advice for the next 3 days.

We recommend to read [Air Quality Info](https://dev.qweather.com/en/docs/resource/air-info/) to learn about the AQIs, pollutants, supported regions and more.

| Interface code | Interface                         | Class       |
| --------------- | ---------------------------- | ------------ |
| airDaily | Air quality daily forecast     | [AirV1DailyResponse](https://dev.qweather.com/en/docs/api/air-quality/air-daily-forecast/#response) |

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
            .airDaily(parameter)
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
[QWeatherObjc airDaily:parameter completionHandler:^(AirV1DailyResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[AirV1DailyResponse](https://dev.qweather.com/en/docs/api/air-quality/air-daily-forecast/#response)
