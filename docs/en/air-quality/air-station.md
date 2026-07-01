[English](air-station.md) | [中文](../../zh/air-quality/air-station.md) · [← Back](../../../README.md)

# Monitoring Station Data

Monitoring Station Data API provides pollutant concentration values from air quality monitoring stations in each country or region.

> **Warning:** Monitoring station data is for reference only, it may be delayed, incorrect or unavailable due to various reasons such as failure, removal, maintenance or local laws and regulations.

| Interface code | Interface         | Class       |
| --------------- | ---------------- | ------------ |
| airStation | Monitoring Station Data  | [AirV1StationResponse](https://dev.qweather.com/en/docs/ios-sdk/air-quality/ios-air-station/#response) |

## Parameters 

**AirV1StationParameter**

- `LocationID` ***(required)*** `String` LocationID of air quality monitoring station, LocationID can be obtained by [GeoAPI](https://dev.qweather.com/en/docs/api/geoapi/). For example `P58911`

- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.

## Sample code

**Swift**

```swift
Task{
    do {
        let parameter = AirV1StationParameter(locationID: "P58911")
        let response = try await QWeather.instance
            .airStation(parameter)
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
AirV1StationParameter * parameter = [AirV1StationParameter instanceWithLocationID:@"P58911" lang:@(LangZH_HANS)];
[QWeatherObjc airStation:parameter completionHandler:^(AirV1StationResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[AirV1StationResponse](https://dev.qweather.com/en/docs/ios-sdk/air-quality/ios-air-station/#response)