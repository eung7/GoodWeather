//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/24.
//

import Foundation

class AddWeatherViewModel {
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        let weatherURL = Constants.Urls.urlForWeatherByCity(city: city)
        let weatherResource = Resource<WeatherResponse>(url: weatherURL) { data in
            return try? JSONDecoder().decode(WeatherResponse.self, from: data)
        }
        WebService.load(resource: weatherResource) { result in
            if let weatherResource = result {
                let vm = WeatherViewModel(weather: weatherResource)
                completion(vm)
            }
        }
    }
}
