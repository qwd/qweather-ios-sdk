//
//  ContentView.swift
//  Example
//
//  Created by LESLIEHAN on 2025/3/25.
//

import SwiftUI
import QWeatherSDK


struct ContentView: View {
    
    
    init() {
        configWeather()
    }
    
    
    private func configWeather(){
        Task {
            do {
                
                // The SDK provides two token generation mechanisms: TokenGenerator and closure-based implementation. Developers can choose either approach based on their needs. It is important to note that if both methods are configured simultaneously, the closure implementation will be automatically disabled. For security purposes, please ensure proper management of sensitive information such as private key, project ID, and credential ID, avoiding storage or transmission in plaintext.
                
                let jwt = JWTGenerator(privateKey: "{YOUR_PRIVATE_KEY}",
                                       pid: "{YOUR_PROJECT_ID}",
                                       kid: "YOUR_KID");
                
                // Developers can also customize a token generator by conforming to the TokenGenerator protocol.
                
                let _ = try await QWeather
                    .getInstance("{YOUR_HOST}")  // Initialize QWeather instance with API host URL
                    .setupTokenGenerator(jwt)
                    /*
                    .setupTokenGenerator({ // Provide a closure to dynamically generate authentication tokens
                        // In production, implement token refresh logic here instead of hardcoding
                        return "{YOUR_TOKEN}"  // Return JWT token for API authentication
                    })
                     */
                    .setupLogEnable(true)  // Enable debug logging (set to false in production)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    
    func testGeoCityLookup() async {
        do {
            let response =  try await QWeather.instance
                .geoCityLookup(.init(location: "101120501"))
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testGeoCityTop() async {
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
    
    func testGeoPoiLookup() async {
        do {
            let response = try await QWeather.instance
                .geoPoiLookup(.init(location: "116.41,39.92", type: .SCENIC))
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testGeoPoiRangeCSTA() async {
        do{
            let response = try await QWeather.instance
                .geoPoiRange(.init(location: "113.88,22.45", type: .CSTA, radius: 50))
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testGeoPoiRangeTSTA() async {
        do {
            let response = try await QWeather.instance
                .geoPoiRange(.init(location: "113.88,22.45", type: .TSTA, radius: 50))
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testWeatherNow() async {
        do {
            let parameter = WeatherParameter(location: "101120501")
            let response = try await QWeather.instance
                .weatherNow(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testWeatherDaily3d() async {
        do {
            let parameter = WeatherParameter(location: "101120501")
            let response = try await QWeather.instance
                .weather3d(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testWeatherDaily7d() async {
        do {
            let parameter = WeatherParameter(location: "101120501")
            let response = try await QWeather.instance
                .weather7d(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testWeatherDaily10d() async {
        do {
            let parameter = WeatherParameter(location: "101120501")
            let response = try await QWeather.instance
                .weather10d(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testWeatherDaily15d() async {
        do {
            let parameter = WeatherParameter(location: "101120501")
            let response = try await QWeather.instance
                .weather15d(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testWeatherDaily30d() async {
        do {
            let parameter = WeatherParameter(location: "101120501")
            let response = try await QWeather.instance
                .weather30d(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testWeatherHourly24h() async {
        do {
            let parameter = WeatherParameter(location: "101010100")
            let response = try await QWeather.instance
                .weather24h(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testWeatherHourly72h() async {
        do {
            let parameter = WeatherParameter(location: "101010100")
            let response = try await QWeather.instance
                .weather72h(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testWeatherHourly168h() async {
        do {
            let parameter = WeatherParameter(location: "101010100")
            let response = try await QWeather.instance
                .weather168h(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testMinutely5m() async {
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
    
    func testGridWeatherNow() async {
        do {
            let parameter = GridWeatherParameter(longitude: 116.41, latitude: 39.92)
            let response = try await QWeather.instance
                .gridNow(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testGrid3d() async {
        do {
            let parameter = GridWeatherParameter(longitude: 116.41, latitude: 39.92)
            let response = try await QWeather.instance
                .grid3d(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testGrid7d() async {
        do {
            let parameter = GridWeatherParameter(longitude: 116.41, latitude: 39.92)
            let response = try await QWeather.instance
                .grid7d(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testGrid24h() async {
        do {
            let parameter = GridWeatherParameter(longitude: 116.41, latitude: 39.92)
            let response = try await QWeather.instance
                .grid24h(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testGrid72h() async {
        do {
            let parameter = GridWeatherParameter(longitude: 116.41, latitude: 39.92)
            let response = try await QWeather.instance
                .grid72h(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testWarningNow() async {
        do {
            let parameter = WarningNowParameter(location: "101120501")
            let response = try await QWeather.instance
                .warningNow(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testWarningList() async {
        do {
            let parameter = WarningListParameter(range: .CN)
            let response = try await QWeather.instance
                .warningList(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testIndicesDaily1d() async {
        do {
            let parameter = IndicesParameter(location: "101120501", type: [.CW,.DRSG])
            let response = try await QWeather.instance
                .indices1d(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testIndicesDaily3d() async {
        do {
            let parameter = IndicesParameter(location: "101120501", type: [.CW,.DRSG])
            let response = try await QWeather.instance
                .indices3d(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    

    func testAirCurrent() async {
        do {
            let parameter = AirV1Parameter(longitude: 116.41, latitude: 39.92)
            let response = try await QWeather.instance
                .airCurrent(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testAirDaily() async {
        do {
            let parameter = AirV1Parameter(longitude: 116.41, latitude: 39.92)
            let response = try await QWeather.instance
                .airDaily(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testAirHourly() async  {
        do{
            let parameter = AirV1Parameter(longitude: 116.41, latitude: 39.92)
            let response = try await QWeather.instance
                .airHourly(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testAirStation() async {
        do {
            let parameter = AirV1StationParameter(locationID: "P58911")
            let response = try await QWeather.instance
                .airStation(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    

    func testAirNow() async {
        do {
            let parameter = AirParameter(location: "101120501")
            let response = try await QWeather.instance
                .airNow(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testAir5d() async {
        do {
            let parameter = AirParameter(location: "101120501")
            let response = try await QWeather.instance
                .air5d(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testHistoricalWeather() async {
        do {
            let threeDaysAgo = Calendar.current.date(byAdding: .day, value: -3, to: Date())!
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            let date = formatter.string(from: threeDaysAgo)
            let parameter = HistoricalWeatherParameter(location: "101120501", date: date)
            let response = try await QWeather.instance
                .historicalWeather(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testHistoricalAir() async {
        do {
            let threeDaysAgo = Calendar.current.date(byAdding: .day, value: -3, to: Date())!
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyMMdd"
            let date = formatter.string(from: threeDaysAgo)
            let parameter = HistoricalAirParameter(location: "101120501", date: date)
            let response = try await QWeather.instance
                .historicalAir(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testStormList() async {
        do {
            let parameter = StormListParameter(basin: .NP, year: 2024)
            let response = try await QWeather.instance
                .tropicalStormList(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testStormForecast() async {
        do {
            let parameter = StormParameter(stormid: "NP_2421")
            let response = try await QWeather.instance
                .tropicalStormForecast(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testStormTrack() async {
        do {
            let parameter = StormParameter(stormid: "NP_2421")
            let response = try await QWeather.instance
                .tropicalStormTrack(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testOceanTide() async {
        do {
            let sevenDaysAfter = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyMMdd"
            let date = formatter.string(from: sevenDaysAfter)
            let parameter = OceanParameter(location: "P2236", date: date)
            let response = try await QWeather.instance
                .oceanTide(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testOceanCurrents() async {
        do {
            let sevenDaysAfter = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyMMdd"
            let date = formatter.string(from: sevenDaysAfter)
            let parameter = OceanParameter(location: "P66981", date: date)
            let response = try await QWeather.instance
                .oceanCurrents(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testAstronomySun() async {
        do {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyMMdd"
            let date = formatter.string(from: Date())
            let parameter = AstronomySunParameter(location: "101120501", date: date)
            let response = try await QWeather.instance
                .astronomySun(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
    func testAstronomyMoon() async {
        do {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyMMdd"
            let date = formatter.string(from: Date())
            let parameter = AstronomyMoonParameter(location: "101120501", date: date)
            let response = try await QWeather.instance
                .astronomyMoon(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    func testAstronomySolarElevationAngle() async {
        do {
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyMMdd"
            let date = dateFormatter.string(from: currentDate)
            
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HHmm"
            timeFormatter.locale = Locale(identifier: "en_US_POSIX")
            let time = timeFormatter.string(from: currentDate)
            
            let parameter = SolarElevationAngleParameter(location: "101120501", date: date, time: time, tz: "0800", alt: "43")
            let response = try await QWeather.instance
                .astronomySolarElevationAngle(parameter)
            print(response)
        } catch QWeatherError.errorResponse(let error) {
            print(error)
        } catch {
            print(error)
        }
    }
    
    
}

#Preview {
    ContentView()
}
