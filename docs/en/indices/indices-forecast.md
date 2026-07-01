[English](indices-forecast.md) | [中文](../../zh/indices/indices-forecast.md) · [← Back](../../../README.md)

# Weather Indices Forecast

Get weather indices forecast data for cities in China and around the world.

- Weather Indices in China: Comfort Indices, Car Wash Indices, Dressing Indices, Cold Indices, Sports Indices, Travel Indices, UV Indices, Air Pollution Indices, Air Conditioning Indices, Allergy Indices, Sunglasses Indices, Makeup Indices, Sunshine Indices, Traffic Indices, Fishing Indices, Sun Protection Indices
- Weather Indices worldwide: Sports Indices, Car Wash Indices, UV Indices, Fishing Indices

| Interface code   | Interface             | Class            |
| ---------------- | ------------------ | ---------------- |
| indices1d | Today Weather Indices           | [IndicesDailyResponse](https://dev.qweather.com/en/docs/ios-sdk/indices/ios-indices-forecast/#response) |
| indices3d | Weather Indices 3-days forecast | [IndicesDailyResponse](https://dev.qweather.com/en/docs/ios-sdk/indices/ios-indices-forecast/#response) |

## Parameters

**IndicesParameter**

- `location` ***(required)*** `String` The location to be queried, support [LocationID](https://dev.qweather.com/en/docs/resource/glossary/#locationid) or comma-separated [longitude and latitude](https://dev.qweather.com/en/docs/resource/glossary/#coordinate) (decimal, up to 2 decimal places), LocationID can be obtained by [GeoAPI](https://dev.qweather.com/en/docs/api/geoapi/). Example: `location=101010100` or `location=116.41,39.92`
- `indices` ***(required)*** `Indices` Weather indices type ID, including car wash index, clothing index, fishing index, etc. You can get multiple types of weather indices at one time. All indices type see [Indices Info](https://dev.qweather.com/en/docs/resource/indices-info/).
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.

## Sample code

**Swift**

```swift
Task{
    do {
        let parameter = IndicesParameter(location: "101010100", type: [.CW,.DRSG])

        /**
        * Get 1-day weather indices data
        */
        let _ = try await QWeather.instance.indices1d(parameter)
        
        /**
        * Get 3-day weather indices data
        */
        let _ = try await QWeather.instance.indices3d(parameter)

    } catch QWeatherError.errorResponse(let error) {
        print(error)
    } catch {
        print(error)
    }
}
```

**Objective-C**

```objc
IndicesParameter *parameter = [IndicesParameter instanceWithLocation:@"101010100" type:@[@(IndicesCW),@(IndicesDRSG)] lang:@(LangZH_HANS)];

void (^handler)(IndicesDailyResponse *, NSError *) = ^(IndicesDailyResponse *response,
    NSError *error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
};

/**
* Get 1-day weather indices data
*/
[QWeatherObjc indices1d:parameter lang:LangZH_HANS completionHandler:handler];

/**
* Get 3-day weather indices data
*/
[QWeatherObjc indices3d:parameter lang:LangZH_HANS completionHandler:handler];
```

## Response

[IndicesDailyResponse](https://dev.qweather.com/en/docs/ios-sdk/indices/ios-indices-forecast/#response)

### Index type and level

See [Indices Info](https://dev.qweather.com/en/docs/resource/indices-info/).



