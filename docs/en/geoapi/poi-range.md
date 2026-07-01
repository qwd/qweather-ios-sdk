[English](poi-range.md) | [中文](../../zh/geoapi/poi-range.md) · [← Back](../../../README.md)

# POI Range

POI Range iOS SDK provides the ability to query all POI information within a specified area.

| Interface code | Interface       | Class        |
| --------- | -------------------------- | ------------ |
| geoPoiRange | POI Range  | [GeoPoiResponse](https://dev.qweather.com/en/docs/ios-sdk/geoapi/ios-poi-range/#response) |

## Parameters

**GeoPoiRangeParameter**

- `location` ***(required)*** `String` The comma-separated [longitude and latitude](https://dev.qweather.com/en/docs/resource/glossary/#coordinate) (decimal, up to 2 decimal places) of the location to be queried.  For example: `location=116.41,39.92`
- `type` ***(required)*** `Poi` Choose to search for a certain type of POI.
    - `scenic` Scenic Spot
    - `TSTA` Tide Station
- `radius` `Int` Set search radius, the value range is 1-50, in kilometers. **5 by default**.
- `number` `Int` Number of the results in response, from 1 to 20, 10 is the default.
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.

## Sample code

**Swift**

```swift
   Task{
        do{
            let response = try await QWeather.instance
                        .geoPoiRange(.init(location: "113.88,22.45", type: .CSTA, radius: 50))
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
    GeoPoiRangeParameter * parameter = [GeoPoiRangeParameter instanceWithLocation:@"116.41,39.92"
                                                                             type:PoiSCENIC
                                                                           radius:@(50)
                                                                           number:@(10)
                                                                             lang:@(LangZH_HANS)];
    [QWeatherObjc geoPoiRange:parameter  completionHandler:^(GeoPoiResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
```

## Response

[GeoPoiResponse](https://dev.qweather.com/en/docs/ios-sdk/geoapi/ios-poi-range/#response)