[English](air-current.md) | [中文](../../zh/air-quality/air-current.md) · [← Back](../../../README.md)

# Current Air Quality

The current air quality (AQI) API provides real-time air quality data for specified locations, data resolution is 1x1 km.

- AQI, category, color and primary pollutant based on local standards for each country or region
- Generic QWeather AQI
- Pollutant concentration values and their sub-index.
- Health effects and advice
- Associated monitoring station information

We recommend to read [Air Quality Info](https://dev.qweather.com/en/docs/resource/air-info/) to learn about the AQIs, pollutants, supported regions and more.

| Interface code | Interface         | Class       |
| --------------- | ---------------- | ------------ |
| airCurrent | Current Air Quality  | [AirV1CurrentResponse](https://dev.qweather.com/en/docs/ios-sdk/air-quality/ios-air-current/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) |

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
            .airCurrent(parameter)
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
[QWeatherObjc airCurrent:parameter completionHandler:^(AirV1CurrentResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[AirV1CurrentResponse](https://dev.qweather.com/en/docs/ios-sdk/air-quality/ios-air-current/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE) 
