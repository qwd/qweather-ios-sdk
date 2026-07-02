[English](poi-lookup.md) | [中文](../../zh/geoapi/poi-lookup.md) · [← Back](../../../README.md)

# POI Lookup

POI Lookup API provides basic information of POI(scenic spot, tide stations, etc.)

| Interface code | Interface         | Class        |
| ---------- | --------------------------- | ------------ |
| geoPoiLookup | POI Lookup  | [GeoPoiResponse](https://dev.qweather.com/en/docs/api/geoapi/poi-lookup/#response) |

## Parameters

**GeoPoiLookupParameter**

- `location` ***(required)*** `String` The location to be queried, support text, [LocationID](https://dev.qweather.com/en/docs/resource/glossary/#locationid), comma-separated [longitude and latitude](https://dev.qweather.com/en/docs/resource/glossary/#coordinate) (decimal, up to 2 decimal places), [Adcode](https://dev.qweather.com/docs/resource/glossary/#adcode)(Chinese cities only).   For example: `location=beijing` or `location=116.41,39.92`
- `type` ***(required)*** `Poi` Choose to search for a certain type of POI.
    - `scenic` Scenic Spot
    - `TSTA` Tide Station
- `city` `String` Search for POI within a given city. The city name can be text or the city's LocationID.   > The city name is an exact match. It is recommended to use LocaitonID. If the text cannot be matched, the data returned will be empty.
- `number` `Int` Number of the results in response, from 1 to 20, 10 is the default.
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.

## Sample code

**Swift**

```swift
Task{
    do {
        let response = try await QWeather.instance
            .geoPoiLookup(.init(location: "116.41,39.92", type: .SCENIC))
    } catch QWeatherError.errorResponse(let error) {
        print(error)
    } catch {
        print(error)
    }
}
```

**Objective-C**

```objc
GeoPoiLookupParameter *parameter = [GeoPoiLookupParameter  instanceWithLocation:@"116.41,39.92" type:PoiSCENIC city:nil number:@(10) lang:@(LangZH_HANS)];
[QWeatherObjc geoPoiLookup: parameter completionHandler:^(GeoPoiResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[GeoPoiResponse](https://dev.qweather.com/en/docs/api/geoapi/poi-lookup/#response)