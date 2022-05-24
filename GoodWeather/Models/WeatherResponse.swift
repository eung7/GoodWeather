//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
