## `location-def`

`location` ***（必选）*** `String` 需要查询地区的[LocationID](https://dev.qweather.com/docs/resource/glossary/#locationid)或以英文逗号分隔的[经度,纬度坐标](https://dev.qweather.com/docs/resource/glossary/#coordinate)（十进制，最多支持小数点后两位），LocationID可通过[GeoAPI](https://dev.qweather.com/docs/api/geoapi/)获取。例如 `location=101010100` 或 `location=116.41,39.92`

## `location-geo`

`location` ***（必选）*** `String` 需要查询地区的名称，支持文字、以英文逗号分隔的[经度,纬度坐标](https://dev.qweather.com/docs/resource/glossary/#coordinate)（十进制，最多支持小数点后两位）、[LocationID](https://dev.qweather.com/docs/resource/glossary/#locationid)或[Adcode](https://dev.qweather.com/docs/resource/glossary/#adcode)（仅限中国城市）。例如 `location=北京` 或 `location=116.41,39.92`

## `location-coord`

`location` ***（必选）*** `String` 需要查询地区的以英文逗号分隔的[经度,纬度坐标](https://dev.qweather.com/docs/resource/glossary/#coordinate)（十进制，最多支持小数点后两位）。例如 `location=116.41,39.92`

## `location-id`

`location` ***（必选）*** `String` 需要查询的地区，仅支持[LocationID](https://dev.qweather.com/docs/resource/glossary/#locationid)，LocationID可通过[GeoAPI](https://dev.qweather.com/docs/api/geoapi/)获取。例如 `location=101010100`

## `location-p2`

`location` ***（必选）*** `String` 需要查询的潮汐站点，请填写潮汐站点的[LocationID](https://dev.qweather.com/docs/resource/glossary/#locationid)，LocationID可通过[POI搜索服务](https://dev.qweather.com/docs/api/geoapi/poi-lookup/)获取。例如 `location=P2951`

## `lang-def`

`lang` `Lang` 多语言设置，请阅读[多语言](https://dev.qweather.com/docs/resource/language/)文档，了解我们的多语言是如何工作、如何设置以及数据是否支持多语言。

## `unit-def`

`unit` `Unit` 数据单位设置，可选值包括`unit=m`（公制单位，默认）和`unit=i`（英制单位）。更多选项和说明参考[度量衡单位](https://dev.qweather.com/docs/resource/unit)。

## `idx-type-ios`

`indices` ***（必选）*** `Indices` 生活指数的类型，包括洗车指数、穿衣指数、钓鱼指数等。可以一次性获取多个类型的生活指数。各项生活指数并非适用于所有城市。具体生活指数的ID和等级参考[天气指数信息](https://dev.qweather.com/docs/resource/indices-info/)。

## `date`

`date` ***（必选）*** `String` 查询日期，格式为yyyyMMdd，例如 `date=20170809`

## `date60`

`date` ***（必选）*** `String` 选择日期，最多可选择未来60天（包含今天）的数据。日期格式为yyyyMMdd，例如 `date=20200531`

## `date10`

`date` ***（必选）*** 选择日期，最多可选择未来10天（包含今天）的数据。日期格式为yyyyMMdd，例如 `date=20200531`

## `date10back`

`date` ***（必选）*** `String` 选择日期，最多可选择最近10天（不包含今天）的数据。日期格式为yyyyMMdd，例如 `date=20200531`

## `time`

`time` ***（必选）*** `String` 查询时间，格式为HHmm，24时制，例如 `time=1230`

## `tz`

`tz` ***（必选）*** `String` 查询地区所在时区，例如`tz=0800`或`tz=-0530`

## `alt`

`alt` ***（必选）*** `Int` 海拔高度，单位为米，例如`alt=43`

## `stormid`

`stormid` ***（必选）*** `String` 需要查询的台风ID，StormID可通过[台风查询API](https://dev.qweather.com/docs/api/tropical-cyclone/storm-list/)获取。例如 `stormid=NP2018`

## `stormid-sdk`

`stormid` ***（必选）*** `String` 需要查询的台风ID，StormID可通过[台风列表](#storm-list)获取。例如 `stormid=NP2018`

## `basin`

`basin` ***（必选）*** `Basin` 需要查询的台风所在的流域，例如中国处于西北太平洋，即 `basin=NP`。当前仅支持`NP`。 - `AL` North Atlantic 北大西洋 - `EP` Eastern Pacific 东太平洋 - `NP` NorthWest Pacific 西北太平洋 - `SP` SouthWestern Pacific 西南太平洋 - `NI` North Indian 北印度洋 - `SI` South Indian 南印度洋

## `year`

`year` ***（必选）*** `String` 支持查询本年度和上一年度的台风，例如：`year=2020`, `year=2019`

## `range`

`range` `Range` 搜索范围，可设定只在某个国家或地区范围内进行搜索，国家和地区名称需使用[ISO 3166 所定义的国家代码](https://dev.qweather.com/docs/resource/glossary/#iso-3166)。如果不设置此参数，搜索范围将在所有城市。例如 `range=cn`

## `range-warning`

`range` ***（必选）*** `Range` 选择指定的国家或地区，使用[ISO 3166](https://dev.qweather.com/docs/resource/glossary/#iso-3166)格式。例如`range=cn`或`range=hk`。目前该功能仅支持中国（包括港澳台）地区的城市列表，其他国家和地区请使用请使用[天气灾害预警]单独获取。

## `number`

`number` `Int` 返回结果的数量，取值范围1-20，默认返回10个结果。

## `adm`

`adm` `String` 城市的上级行政区划，可设定只在某个行政区划范围内进行搜索，用于排除重名城市或对结果进行过滤。例如 `adm=beijing`

## `geo-type`

`type` ***（必选）*** `Poi` POI类型，可选择搜索某一类型的POI。 - `scenic` 景点 - `TSTA` 潮汐站点

## `city`

`city` `String` 选择POI所在城市，可设定只搜索在特定城市内的POI信息。城市名称可以是文字或城市的LocationID。**默认不限制特定城市**。  > 城市名称为精准匹配，建议使用LocaitonID，如文字无法匹配，则数据返回为空。

## `radius`

`radius` `Int` 搜索范围，可设置搜索半径，取值范围1-50，单位：公里。**默认5公里**。

## `p-location-id-aqsta`

`LocationID` ***（必选）*** `String` 空气质量监测站的LocationID，LocationID可通过[GeoAPI](https://dev.qweather.com/docs/api/geoapi/)获取。例如 `P58911`

## `p-location-id`

`LocationID` ***（必选）*** `String` 所需查询城市的[LocationID](https://dev.qweather.com/docs/resource/glossary/#locationid)，LocationID可通过[GeoAPI](https://dev.qweather.com/docs/api/geoapi/)获取。例如 `101010100`

## `p-lat`

`latitude` ***（必选）*** `Double` 所需位置的纬度。十进制，最多支持小数点后两位。例如 `39.92`

## `p-lon`

`longitude` ***（必选）*** `Double` 所需位置的经度。十进制，最多支持小数点后两位。例如 `116.41`

## `p-alertid`

`alertId` ***（必选）*** `String` 需要查询的天气预警信息的ID

## `q-localtime`

`localTime` `Bool` 是否返回查询地点的本地时间。`true` 返回本地时间，`false` 返回UTC时间（默认）。

