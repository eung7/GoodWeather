//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/25.
//

import Foundation

extension Double {
    func formatAsDegree() -> String {
        return String(format: "%.0f°", self)
    }
}
