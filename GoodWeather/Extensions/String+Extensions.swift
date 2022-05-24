//
//  String+Extension.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/24.
//

import Foundation

extension String {
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
