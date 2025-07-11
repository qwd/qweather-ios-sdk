//
//  ViewController.m
//  ExampleObjc
//
//  Created by LESLIEHAN on 2025/3/26.
//

#import "ViewController.h"
#import <QWeatherSDK/QWeatherSDK-Swift.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configWeather];
}


-(void)configWeather{
    // Initialize QWeather instance with API host URL
    [QWeatherObjc initConfigWithHost:@"{YOUR_HOST}"];
    
    // Set the token generator using the method provided by the SDK.
    [QWeatherObjc setupTokenGeneratorWithPrivateKey:@"{YOUR_PRIVATE_KEY}" // Pravite Key
                                              pid:@"{YOUR_PROJECT_ID}" // Project ID
                                              kid:@"{YOUR_KID}"]; // Credential ID
    /*
    [QWeatherObjc setupTokenGeneratorWithGenerater:^NSString * _Nonnull{
        // Provide a closure to dynamically generate authentication tokens
        // In production, implement token refresh logic here instead of hardcoding
        return  @"{YOUR_TOKEN}"; // Return JWT token for API authentication
    }];
    */
    
    // Enable debug logging (set to false in production)
    [QWeatherObjc setupLogEnable:YES];
}

- (void)testGeoCityLookup{
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
}

- (void)testGeoCityTop {
    GeoCityTopParameter *parameter = [GeoCityTopParameter instanceWithRange:@(RangeCN) number:@(10) lang:@(LangZH_HANS)];
    [QWeatherObjc geoCityTop:parameter completionHandler:^(GeoCityTopResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testGeoPoiLookup {
    GeoPoiLookupParameter *parameter = [GeoPoiLookupParameter  instanceWithLocation:@"116.41,39.92" type:PoiSCENIC city:nil number:@(10) lang:@(LangZH_HANS)];
    [QWeatherObjc geoPoiLookup: parameter completionHandler:^(GeoPoiResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testGeoPoiRange {
    GeoPoiRangeParameter * parameter = [GeoPoiRangeParameter instanceWithLocation:@"116.41,39.92"
                                                                             type:PoiSCENIC
                                                                           radius:@(50)
                                                                           number:@(10)
                                                                             lang:@(LangZH_HANS)];
    [QWeatherObjc geoPoiRange:parameter completionHandler:^(GeoPoiResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (void)testWeatherNow{
    WeatherParameter * parameter = [WeatherParameter instanceWithLocation:@"101120501" lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc weatherNow:parameter completionHandler:^(WeatherNowResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            switch (error.code) {
                case QWeatherErrorStatusCommon:
                    break;
                case QWeatherErrorStatusNotToken:
                    break;
                case QWeatherErrorStatusErrorResponse: {
                    NSDictionary * errorDictionary = error.userInfo;
                    ErrorDetail * detail = [ErrorDetail fromMap:errorDictionary];
                    NSLog(@"ErrorDetail: %@",detail);
                }
                    break;
                default:
                    NSLog(@"其它异常:%@",error.localizedDescription);
                    break;
            }
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testWeather3d{
    WeatherParameter * parameter = [WeatherParameter instanceWithLocation:@"101120501" lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc weather3d:parameter completionHandler:^(WeatherDailyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testWeather7d{
    WeatherParameter * parameter = [WeatherParameter instanceWithLocation:@"101120501" lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc weather7d:parameter completionHandler:^(WeatherDailyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testWeather10d{
    WeatherParameter * parameter = [WeatherParameter instanceWithLocation:@"101120501" lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc weather10d:parameter completionHandler:^(WeatherDailyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testWeather15d{
    WeatherParameter * parameter = [WeatherParameter instanceWithLocation:@"101120501" lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc weather15d:parameter completionHandler:^(WeatherDailyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testWeather30d{
    WeatherParameter * parameter = [WeatherParameter instanceWithLocation:@"101120501" lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc weather30d:parameter completionHandler:^(WeatherDailyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}


-(void)testWeather24h{
    WeatherParameter * parameter = [WeatherParameter instanceWithLocation:@"101120501" lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc weather24h:parameter completionHandler:^(WeatherHourlyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}


-(void)testWeather72h{
    WeatherParameter * parameter = [WeatherParameter instanceWithLocation:@"101120501" lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc weather72h:parameter completionHandler:^(WeatherHourlyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testWeather168h{
    WeatherParameter * parameter = [WeatherParameter instanceWithLocation:@"101120501" lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc weather168h:parameter completionHandler:^(WeatherHourlyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}


-(void)testMinutuely{
    MinutelyParameter * paramater = [MinutelyParameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS)];
    [QWeatherObjc minutely:paramater completionHandler:^(MinutelyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)gridWeatherNow{
    GridWeatherParameter *parameter = [GridWeatherParameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc gridNow:parameter completionHandler:^(GridNowResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)gridWeather3d{
    GridWeatherParameter *parameter = [GridWeatherParameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc grid3d:parameter completionHandler:^(GridDailyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)gridWeather7d{
    GridWeatherParameter *parameter = [GridWeatherParameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc grid7d:parameter completionHandler:^(GridDailyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}



-(void)gridWeather24h{
    GridWeatherParameter *parameter = [GridWeatherParameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc grid24h:parameter completionHandler:^(GridHourlyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)gridWeather72h{
    GridWeatherParameter *parameter = [GridWeatherParameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc grid24h:parameter completionHandler:^(GridHourlyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)warningNow{
    WarningNowParameter *parameter = [WarningNowParameter instanceWithLocation:@"101120501" lang:@(LangZH_HANS)];
    [QWeatherObjc warningNow:parameter completionHandler:^(WarningResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)warningList{
    WarningListParameter *parameter = [WarningListParameter instanceWithRange:RangeCN];
    [QWeatherObjc warningList:parameter completionHandler:^(WarningListResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}


-(void)testIndicesDaily1d {
    IndicesParameter *parameter = [IndicesParameter instanceWithLocation:@"101120501" type:@[@(IndicesCW),@(IndicesDRSG)] lang:@(LangZH_HANS)];
    [QWeatherObjc indices1d:parameter  completionHandler:^(IndicesDailyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testIndicesDaily3d {
    IndicesParameter *parameter = [IndicesParameter instanceWithLocation:@"101120501" type:@[@(IndicesCW),@(IndicesDRSG)] lang:@(LangZH_HANS)];
    [QWeatherObjc indices3d:parameter completionHandler:^(IndicesDailyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testAirCurrent {
    AirV1Parameter *parameter = [AirV1Parameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS)];
    [QWeatherObjc airCurrent:parameter completionHandler:^(AirV1CurrentResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testAirDaily {
    AirV1Parameter *parameter = [AirV1Parameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS)];
    [QWeatherObjc airDaily:parameter completionHandler:^(AirV1DailyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testAirHourly {
    AirV1Parameter *parameter = [AirV1Parameter instanceWithLongitude:116.41 latitude:39.92 lang:@(LangZH_HANS)];
    [QWeatherObjc airHourly:parameter completionHandler:^(AirV1HourlyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}


-(void)testAirStation{
    AirV1StationParameter * parameter = [AirV1StationParameter instanceWithLocationID:@"P58911" lang:@(LangZH_HANS)];
    [QWeatherObjc airStation:parameter completionHandler:^(AirV1StationResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testAirNow{
    AirParameter * parameter = [AirParameter instanceWithLocation:@"101120501" lang:@(LangZH_HANS)];
    [QWeatherObjc airNow:parameter completionHandler:^(AirNowResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testAir5d{
    AirParameter * parameter = [AirParameter instanceWithLocation:@"101120501" lang:@(LangZH_HANS)];
    [QWeatherObjc air5d:parameter completionHandler:^(AirDailyResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}


-(void)testHistoricalWeather{
    NSDate * threeDaysAgo = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:-3 toDate:[NSDate date] options:0];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString * date = [formatter stringFromDate:threeDaysAgo];
    HistoricalWeatherParameter *parameter = [HistoricalWeatherParameter instanceWithLocation:@"101120501" date:date lang:@(LangZH_HANS) unit:@(UnitMETRIC)];
    [QWeatherObjc historicalWeather:parameter completionHandler:^(HistoricalWeatherResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}


-(void)testHistoricalAir{
    NSDate * threeDaysAgo = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:-3 toDate:[NSDate date] options:0];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString * date = [formatter stringFromDate:threeDaysAgo];
    HistoricalAirParameter *parameter = [HistoricalAirParameter instanceWithLocation:@"101120501" date:date lang:@(LangZH_HANS)];
    [QWeatherObjc historicalAir:parameter completionHandler:^(HistoricalAirResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testStormList{
    StormListParameter *parameter = [StormListParameter instanceWithBasin:BasinNP year:2024];
    [QWeatherObjc tropicalStormList:parameter completionHandler:^(StormListResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testStormForecast{
    StormParameter *parameter = [StormParameter instanceWithStormid:@"NP_2421"];
    [QWeatherObjc tropicalStormForecast:parameter completionHandler:^(StormForecastResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testStormTrack{
    StormParameter *parameter = [StormParameter instanceWithStormid:@"NP_2421"];
    [QWeatherObjc tropicalStormTrack:parameter completionHandler:^(StormTrackResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testOceanTide {
    NSDate * sevenDaysAfter = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:7 toDate:[NSDate date] options:0];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString * date = [formatter stringFromDate:sevenDaysAfter];
    OceanParameter *parameter = [OceanParameter instanceWithLocation:@"P2236" date:date];
    [QWeatherObjc oceanTide:parameter completionHandler:^(OceanTideResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)testOceanCurrents {
    NSDate * sevenDaysAfter = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:7 toDate:[NSDate date] options:0];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString * date = [formatter stringFromDate:sevenDaysAfter];
    OceanParameter *parameter = [OceanParameter instanceWithLocation:@"P66981" date:date];
    [QWeatherObjc oceanCurrents:parameter completionHandler:^(OceanCurrentsResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)tesAstronomySun{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString * date = [formatter stringFromDate:[NSDate date]];
    AstronomySunParameter *parameter = [AstronomySunParameter instanceWithLocation:@"101120501" date:date];
    [QWeatherObjc astronomySun:parameter completionHandler:^(AstronomySunResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)tesAstronomyMoon{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString * date = [formatter stringFromDate:[NSDate date]];
    AstronomyMoonParameter *parameter = [AstronomyMoonParameter instanceWithLocation:@"101120501" date:date lang:@(LangZH_HANS)];
    [QWeatherObjc astronomyMoon:parameter completionHandler:^(AstronomyMoonResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

-(void)tesAstronomySolarElevationAngle{
    NSDate * current = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString * date = [formatter stringFromDate:current];
    
    NSDateFormatter * timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"yyyyMMdd"];
    [timeFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    NSString * time = [formatter stringFromDate:current];
    
    SolarElevationAngleParameter *parameter = [SolarElevationAngleParameter instanceWithLocation:@"116.41,39.92" date:date time:time tz:@"0800" alt:@"43"];
    
    [QWeatherObjc astronomySolarElevationAngle:parameter completionHandler:^(AstronomySolarElevationAngleResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"%@", response.description);
        }
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}


@end
