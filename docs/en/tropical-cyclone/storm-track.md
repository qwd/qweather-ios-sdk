[English](storm-track.md) | [中文](../../zh/tropical-cyclone/storm-track.md) · [← Back](../../../README.md)

# Storm Track

Get the tropical cyclones location, level, pressure, windspeed, and track path of active storm in major ocean basins around the world.

| Interface code  | Interface | Class |
| ---------------- | -------------- | ---------------------- |
| tropicalStormTrack | Storm Track  | [StormTrackResponse](https://dev.qweather.com/en/docs/api/tropical-cyclone/storm-track/#response) |

## Parameters

**StormParameter**

- `stormid` ***(required)*** `String` The storm ID that needs to be queried, StormID can be obtained by [Storm List](#storm-list), e.g., `stormid=NP2018`

## Sample code

**Swift**

```swift
Task{
    do {
        let parameter = StormParameter(stormid: "NP_2421")
        let response = try await QWeather.instance
            .tropicalStormTrack(parameter)
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
StormParameter *parameter = [StormParameter instanceWithStormid:@"NP_2421"];
[QWeatherObjc tropicalStormTrack:parameter completionHandler:^(StormTrackResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```
     
## Response

[StormTrackResponse](https://dev.qweather.com/en/docs/api/tropical-cyclone/storm-track/#response)

### Typhoon level

GBT 19201-2006

| Tropical cyclone level | Maximum average wind speed near the bottom center (m/s) | Maximum wind near the bottom center (level) |
| ------------------- | ----------------------------- | ------------------------ |
| Tropical pressure (TD) | 10.8-17.1 | 6-7 |
| Tropical Storm (TS) | 17.2-24.4 | 8-9 |
| Severe Tropical Storm (STS) | 24.5-32.6 | 10-11 |
| Typhoon (TY) | 32.7-41.4 | 12-13 |
| Severe Typhoon (STY) | 41.5-50.9 | 14-15 |
| Super Typhoon (SuperTY) | ≥51.0 | 16 or above |