//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/25.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        switch self {
        case .celsius:
            return "Celcius"
        case .fahrenheit:
            return "Fahrenheit"
        }
    }
}

class SettingsViewModel {
    let units = Unit.allCases
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            var unitValue = ""
            if let value = userDefaults.value(forKey: "unit") as? String {
                unitValue = value
            }
            return Unit(rawValue: unitValue) ?? Unit.celsius
        }
        set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}
