//
//  WebService.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/24.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

class WebService {
    static func load<T>(resource: Resource<T>, completion: @escaping (T?) -> Void) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            print(data)
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        }
        .resume()
    }
}

//let resource = Resource<WeatherResponse>(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?q=tokyo&appid=2f94734b59ed393c884ba97fae88e446&units=imperial")!) { data in
//    return try? JSONDecoder().decode(WeatherResponse.self, from: data)
//}
//
//WebService.load(resource: resource) { weatherResponse in
//    if let weatherResponse = weatherResponse {
//        print(weatherResponse)
//    }
//}
