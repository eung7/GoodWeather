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
