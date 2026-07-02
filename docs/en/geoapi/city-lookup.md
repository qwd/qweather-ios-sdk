[English](city-lookup.md) | [中文](../../zh/geoapi/city-lookup.md) · [← Back](../../../README.md)

# City Lookup

City Lookup provides reverse geocoding, geolocation lookup services, supports multi-language, fuzzy search and other functions.

With the City Lookup, you can get the basic information of the city, including the Location ID of the city (you need this ID to get the weather), multilingual name, latitude and longitude, time zone, altitude, rank, administrative, etc.

In addition, GeoAPI - City Lookup can also help you to implement fuzzy search in your APP, users only need to type 1 or 2 words to get results.

| Interface code | Interface     | Class                 |
| -------------- | ------------- | --------------------- |
| geoCityLookup | City lookup   | [GeoCityLookupResponse](https://dev.qweather.com/en/docs/api/geoapi/city-lookup/#response) |

## Parameters

**GeoCityLookupParameter**

- `location` ***(required)*** `String` The location to be queried, support text, [LocationID](https://dev.qweather.com/en/docs/resource/glossary/#locationid), comma-separated [longitude and latitude](https://dev.qweather.com/en/docs/resource/glossary/#coordinate) (decimal, up to 2 decimal places), [Adcode](https://dev.qweather.com/docs/resource/glossary/#adcode)(Chinese cities only).   For example: `location=beijing` or `location=116.41,39.92`
- `adm` `String` Superior administrative divisions of a city, useful for excluding cities with similar names or for filtering results. Example `adm = beijing`
- `range` `Range` Set to search only within a certain country or region. The country and region name needs to use [country code ISO 3166](https://dev.qweather.com/en/docs/resource/glossary/#iso-3166). If this parameter is not set, the search range will be all cities. Example: `range=cn`
- `number` `Int` Number of the results in response, from 1 to 20, 10 is the default.
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.


## Sample code

**Swift**
```swift
Task{
    do {
        let response =  try await QWeather.instance
            .geoCityLookup(.init(location: "101010100"))
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
GeoCityLookupParameter *parameter = [GeoCityLookupParameter instanceWithLocation:@"116.41,39.92"
                                        adm:nil
                                    range:@(RangeCN)
                                    number:@(10)
                                    lang:@(LangZH_HANS)];
[QWeatherObjc geoCityLookup: parameter completionHandler:^(GeoCityLookupResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[GeoCityLookupResponse](https://dev.qweather.com/en/docs/api/geoapi/city-lookup/#response)

