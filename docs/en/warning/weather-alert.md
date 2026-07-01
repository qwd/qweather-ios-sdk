[English](weather-alert.md) | [中文](../../zh/warning/weather-alert.md) · [← Back](../../../README.md)

# Weather Alert

Get officially issued real-time severe weather alert data around the world.

> **Hint:** For the implementation of weather alert, see [Resource - Alert Info](https://dev.qweather.com/en/docs/resource/warning-info/) in advance.


| Interface code     | Interface    | Class           |
| -------------------- | -------- | ---------------- |
| weatherAlertCurrent | Weather Alert | [WeatherAlertCurrentResponse](https://dev.qweather.com/en/docs/ios-sdk/warning/ios-weather-alert/#response) |

## Parameters

**WeatherAlertCurrentParameter**

- `longitude` ***(required)*** `Double` The longitude of the desired location. Decimal format, up to 2 decimal places. For example `116.41`
- `latitude` ***(required)*** `Double` The latitude of the desired location. Decimal format, up to 2 decimal places. For example `39.92`
- `localTime` `Bool` Whether to return the local time of the queried location. `true` for local time, `false` for UTC time (default).
- `lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.


## Sample code

**Swift**

```swift
Task {
    do {
        let parameter = WeatherAlertCurrentParameter(longitude: 113.26, 
                                                      latitude: 38.73, 
                                                     localTime: false, 
                                                          lang: .ZH_HANS)
        let response = try await Q.weatherAlertCurrent(parameter)
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
WeatherAlertCurrentParameter *parameter = [WeatherAlertCurrentParameter instanceWithLongitude: 113.26 
                                                                                     latitude: 38.73 
                                                                                    localTime: NO 
                                                                                         lang: @(LangZH_HANS)];
[QWeatherObjc weatherAlertCurrent:parameter completionHandler:^(WeatherAlertCurrentResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## Response

[WeatherAlertCurrentResponse](https://dev.qweather.com/en/docs/ios-sdk/warning/ios-weather-alert/#response)
