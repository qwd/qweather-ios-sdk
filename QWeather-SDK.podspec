#
#  Be sure to run `pod spec lint QWeather-SDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "QWeather-SDK"
  s.version      = "5.1.0"
  s.summary      = "Official QWeather SDK"
  s.description  = "<<-DESC
                    QWeather Develop Service is based on advanced meteorological and artificial intelligence algorithms, provides a wide range and accurate weather data services for developers to help you display the weather in your applications or to help your business decisions.
                    DESC"

  s.homepage     = "https://dev.qweather.com/en/docs"
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }
  s.author       = { "xiaobai" => "hanxiaobai@qweather.com" }


  s.ios.deployment_target = "15.0"
  s.osx.deployment_target = "11.0"
  s.watchos.deployment_target = "8.0"
  s.tvos.deployment_target = '15.0'

  s.source = { :git => 'https://github.com/qwd/qweather-ios-sdk.git', :tag => s.version.to_s }

  s.swift_version = '6.0'

  s.static_framework = true
  s.vendored_frameworks = "QWeatherSDK.xcframework"
end