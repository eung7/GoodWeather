//
//  Constants.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/24.
//

import Foundation

struct Constants {
    struct Urls {
        static func urlForWeatherByCity(city: String) -> URL {
            // let userDefaults = UserDefaults.standard
            // let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=2f94734b59ed393c884ba97fae88e446&units=imperial")!
        }
    }
}
