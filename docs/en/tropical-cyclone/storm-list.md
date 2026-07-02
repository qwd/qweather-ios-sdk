[English](storm-list.md) | [中文](../../zh/tropical-cyclone/storm-list.md) · [← Back](../../../README.md)

# Storm list

Get a list of tropical cyclones for the last 2 years in major ocean basins around the world.

> Only the coastal areas of China are supported now, i.e. `basin=NP`


| Interface code     | Interface          | Class             |
| ------------------ | ------------------ | ----------------- |
| tropicalStormList | Storm list | [StormListResponse](https://dev.qweather.com/en/docs/api/tropical-cyclone/storm-list/#response) |

## Parameters

**StormListParameter**

- `basin` ***(required)*** `Basin` The basin where the storm needs to be queried. For now, only support `NP`.
  - `AL` North Atlantic 
  - `EP` Eastern Pacific 
  - `NP` NorthWest Pacific 
  - `SP` SouthWestern Pacific 
  - `NI` North Indian North Indian Ocean 
  - `SI` South Indian South Indian Ocean
- `year` ***(required)*** `String` Support to query storm of this year and last year, e.g., `year=2020`

## Sample code

**Swift**

```swift
Task{
    do {
        let parameter = StormListParameter(basin: .NP, year: 2024)
        let response = try await QWeather.instance
            .tropicalStormList(parameter)
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
StormListParameter *parameter = [StormListParameter instanceWithBasin:BasinNP year:2024];
[QWeatherObjc tropicalStormList:parameter completionHandler:^(StormListResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```
     
## Response

[StormListResponse](https://dev.qweather.com/en/docs/api/tropical-cyclone/storm-list/#response)

