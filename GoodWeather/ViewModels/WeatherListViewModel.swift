//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/25.
//

import Foundation

class WeatherListViewModel {
    
}

class WeatherViewModel {
    let weather: WeatherResponse
    
    init(weather: WeatherResponse) {
        self.weather = weather
    }
}

extension WeatherViewModel {
    var city: String { return weather.name }
    var temperature: String { return "\(weather.main.temp)" }
}
