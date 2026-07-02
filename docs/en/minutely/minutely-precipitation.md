[English](minutely-precipitation.md) | [中文](../../zh/minutely/minutely-precipitation.md) · [← Back](../../../README.md)

# Minutely Precipitation

Get minute-level precipitation forecast data every 5 minutes for the next 2 hours in China.

> This data is only supported for Chinese cities.

| Interface code| Interface  | Class |
| ---------- | ----------- | ------------ |
| minutely | Minutely Precipitation  | [MinutelyResponse](https://dev.qweather.com/en/docs/api/minutely/minutely-precipitation/#response) |

## Parameters

**MinutelyParameter**

- `latitude` ***(required)*** `Double` The latitude of the desired location. Decimal format, up to 2 decimal places. For example `39.92`
- `longitude` ***(required)*** `Double` The longitude of the desired location. Decimal format, up to 2 decimal places. For example `116.41`
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.

## Sample code

**Swift**

```swift
Task{
    do {
        let parameter = MinutelyParameter(longitude: 116.41, latitude: 39.92)
        let response = try await QWeather.instance
            .minutely(parameter)
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
MinutelyParameter * paramater = [MinutelyParameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS)];
[QWeatherObjc minutely:paramater completionHandler:^(MinutelyResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[MinutelyResponse](https://dev.qweather.com/en/docs/api/minutely/minutely-precipitation/#response)