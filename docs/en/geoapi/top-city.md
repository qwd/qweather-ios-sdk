[English](top-city.md) | [中文](../../zh/geoapi/top-city.md) · [← Back](../../../README.md)

# Top city

Get a list of popular cities around the world.

| Interface code | Interface     | Class              |
| -------------- | ------------- | ------------------ |
| geoCityTop    | Top city      | [GeoCityTopResponse](https://dev.qweather.com/en/docs/api/geoapi/top-city/#response) |

## Parameters

**GeoCityTopParameter**

- `range` `Range` Set to search only within a certain country or region. The country and region name needs to use [country code ISO 3166](https://dev.qweather.com/en/docs/resource/glossary/#iso-3166). If this parameter is not set, the search range will be all cities. Example: `range=cn`
- `number` `Int` Number of the results in response, from 1 to 20, 10 is the default.
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.

## Sample code

**Swift**

```swift
Task{
    do {
        let response = try await QWeather.instance
            .geoCityTop(.init(range: Range.CN))
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
GeoCityTopParameter *parameter = [GeoCityTopParameter instanceWithRange:@(RangeCN) number:@(10) lang:@(LangZH_HANS)];
[QWeatherObjc geoCityTop:parameter completionHandler:^(GeoCityTopResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[GeoCityTopResponse](https://dev.qweather.com/en/docs/api/geoapi/top-city/#response)