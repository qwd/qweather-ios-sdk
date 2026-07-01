[English](../../en/geoapi/top-city.md) | [中文](top-city.md) · [← Back](../../../README-zh.md)

# 热门城市查询

获取全球各个国家国家热门城市列表，通过该列表可以让用户轻松查看各国主要城市的天气状况。

| 接口代码      | 接口         | 数据类              |
| ------------ | ----------- | ------------------ |
| geoCityTop  | 热门城市查询  | [GeoCityTopResponse](https://dev.qweather.com/docs/api/geoapi/top-city/#response) |

## 参数

**GeoCityTopParameter**

- `range` `Range` 搜索范围，可设定只在某个国家或地区范围内进行搜索，国家和地区名称需使用[ISO 3166 所定义的国家代码](https://dev.qweather.com/docs/resource/glossary/#iso-3166)。如果不设置此参数，搜索范围将在所有城市。例如 `range=cn`
- `number` `Int` 返回结果的数量，取值范围1-20，默认返回10个结果。
- `lang` `Lang` 多语言设置，请阅读[多语言](https://dev.qweather.com/docs/resource/language/)文档，了解我们的多语言是如何工作、如何设置以及数据是否支持多语言。

## 示例代码

**Swift**

```swift
Task{
    do {
        let parameter = GeoCityTopParameter(range: Range.CN)
        let response = try await QWeather.instance
            .geoCityTop(parameter)
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
GeoCityTopParameter *parameter = [GeoCityTopParameter instanceWithRange:@(RangeCN) 
                                        number:@(10) 
                                        lang:@(LangZH_HANS)];
[QWeatherObjc geoCityTop:parameter completionHandler:^(GeoCityTopResponse * _Nullable response, NSError * _Nullable error) {
    if (response) {
        NSLog(@"%@", response.description);
    }
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}];
```

## 返回数据

[GeoCityTopResponse](https://dev.qweather.com/docs/api/geoapi/top-city/#response) 