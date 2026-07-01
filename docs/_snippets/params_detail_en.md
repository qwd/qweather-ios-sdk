## `location-def`

`location` ***(required)*** `String` The location to be queried, support [LocationID](https://dev.qweather.com/en/docs/resource/glossary/#locationid) or comma-separated [longitude and latitude](https://dev.qweather.com/en/docs/resource/glossary/#coordinate) (decimal, up to 2 decimal places), LocationID can be obtained by [GeoAPI](https://dev.qweather.com/en/docs/api/geoapi/). Example: `location=101010100` or `location=116.41,39.92`

## `location-geo`

`location` ***(required)*** `String` The location to be queried, support text, [LocationID](https://dev.qweather.com/en/docs/resource/glossary/#locationid), comma-separated [longitude and latitude](https://dev.qweather.com/en/docs/resource/glossary/#coordinate) (decimal, up to 2 decimal places), [Adcode](https://dev.qweather.com/docs/resource/glossary/#adcode)(Chinese cities only).   For example: `location=beijing` or `location=116.41,39.92`

## `location-coord`

`location` ***(required)*** `String` The comma-separated [longitude and latitude](https://dev.qweather.com/en/docs/resource/glossary/#coordinate) (decimal, up to 2 decimal places) of the location to be queried.  For example: `location=116.41,39.92`

## `location-id`

`location` ***(required)*** `String` The location to be queried, only support [LocationID](https://dev.qweather.com/en/docs/resource/glossary/#locationid) and LocationID can be obtained by [GeoAPI](https://dev.qweather.com/en/docs/api/geoapi/).   For example: `location=101010100`

## `location-p2`

`location` ***(required)*** `String` The tide station to be queried, need [LocationID](https://dev.qweather.com/en/docs/resource/glossary/#locationid) and LocationID can be obtained by [POI Lookup](https://dev.qweather.com/en/docs/api/geoapi/poi-lookup/).   For example: `location=P2951`

## `lang-def`

`lang` `Lang` Multi-language setting, please see [Language](https://dev.qweather.com/en/docs/resource/language/) to find out how our multi-language works and how to set up.

## `unit-def`

`unit` `Unit` Set weather data unit, the available value are `unit=m` for metric(default) and `unit=i` for imperial. See more about [Unit](https://dev.qweather.com/en/docs/resource/unit).

## `idx-type-ios`

`indices` ***(required)*** `Indices` Weather indices type ID, including car wash index, clothing index, fishing index, etc. You can get multiple types of weather indices at one time. All indices type see [Indices Info](https://dev.qweather.com/en/docs/resource/indices-info/).

## `date`

`date` ***(required)*** `String` Set date, format is yyyyMMdd, e.g., `date=20200531`

## `date60`

`date` ***(required)*** `String` Set the date, up to 60 days in the future (including today). The date format is yyyyMMdd. Example: `date=20200531`

## `date10`

`date` ***(required)*** Set the date, up to 10 days in the future (including today). The date format is yyyyMMdd. Eexample: `date=20200531`

## `date10back`

`date` ***(required)*** `String` Set the date, up to the most recent 10 days. The date format is yyyyMMdd. Example: `date=20200531`

## `time`

`time` ***(required)*** `String` Set time, format is HHmm, 24-hour, e.g., `time=1230`

## `tz`

`tz` ***(required)*** `String` Location time zone, e.g., `tz=0800` or `tz=-0530`

## `alt`

`alt` ***(required)*** `Int` Location altitude, in meters, e.g., `alt=43`

## `stormid`

`stormid` ***(required)*** `String` The storm ID that needs to be queried, StormID can be obtained by [Storm List API](https://dev.qweather.com/en/docs/api/tropical-cyclone/storm-list/), e.g., `stormid=NP2018`

## `stormid-sdk`

`stormid` ***(required)*** `String` The storm ID that needs to be queried, StormID can be obtained by [Storm List](#storm-list), e.g., `stormid=NP2018`

## `basin`

`basin` ***(required)*** `Basin` The basin where the storm needs to be queried. For now, only support `NP`. - `AL` North Atlantic - `EP` Eastern Pacific - `NP` NorthWest Pacific - `SP` SouthWestern Pacific - `NI` North Indian North Indian Ocean - `SI` South Indian South Indian Ocean

## `year`

`year` ***(required)*** `String` Support to query storm of this year and last year, e.g., `year=2020`

## `range`

`range` `Range` Set to search only within a certain country or region. The country and region name needs to use [country code ISO 3166](https://dev.qweather.com/en/docs/resource/glossary/#iso-3166). If this parameter is not set, the search range will be all cities. Example: `range=cn`

## `range-warning`

`range` ***(required)*** `Range` Set country or region, [ISO 3166](https://dev.qweather.com/en/docs/resource/glossary/#iso-3166) format, example: `range=cn` or `range=hk`. Currently this function only supports city list in China (including Hong Kong, Macao and China Taiwan), for other countries and regions please use [Weather Warning](https://dev.qweather.com/en/docs/api/warning/weather-warning/) to get it separately.

## `number`

`number` `Int` Number of the results in response, from 1 to 20, 10 is the default.

## `adm`

`adm` `String` Superior administrative divisions of a city, useful for excluding cities with similar names or for filtering results. Example `adm = beijing`

## `geo-type`

`type` ***(required)*** `Poi` Choose to search for a certain type of POI.   - `scenic` Scenic Spot - `TSTA` Tide Station

## `city`

`city` `String` Search for POI within a given city. The city name can be text or the city's LocationID.   > The city name is an exact match. It is recommended to use LocaitonID. If the text cannot be matched, the data returned will be empty.

## `radius`

`radius` `Int` Set search radius, the value range is 1-50, in kilometers. **5 by default**.

## `p-location-id-aqsta`

`LocationID` ***(required)*** `String` LocationID of air quality monitoring station, LocationID can be obtained by [GeoAPI](https://dev.qweather.com/en/docs/api/geoapi/). For example `P58911`

## `p-location-id`

`LocationID` ***(required)*** `String` [LocationID](https://dev.qweather.com/docs/resource/glossary/#locationid) of the desired city, LocationID can be obtained by [GeoAPI](https://dev.qweather.com/en/docs/api/geoapi/). For example `101010100`

## `p-lat`

`latitude` ***(required)*** `Double` The latitude of the desired location. Decimal format, up to 2 decimal places. For example `39.92`

## `p-lon`

`longitude` ***(required)*** `Double` The longitude of the desired location. Decimal format, up to 2 decimal places. For example `116.41`

## `p-alertid`

`alertId` ***(required)*** `String` The ID of the weather alert information to be queried

## `q-localtime`

`localTime` `Bool` Whether to return the local time of the queried location. `true` for local time, `false` for UTC time (default).

