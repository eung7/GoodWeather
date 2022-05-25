//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/24.
//

import UIKit
import SnapKit

class WeatherCell: UITableViewCell {
    static let identifier = "WeatherCell"
    
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Incheon"
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32.0)
        label.textColor = .systemGray
        label.text = "23°"
        
        return label
    }()
    
    func configure(_ vm: WeatherViewModel) {
        cityNameLabel.text = vm.city
        temperatureLabel.text = "\(vm.temperature.formatAsDegree())"
    }
    
    func setupUI() {
        [ cityNameLabel, temperatureLabel ]
            .forEach { contentView.addSubview($0) }
        
        cityNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.top.leading.equalToSuperview().inset(16)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.top.trailing.equalToSuperview().inset(16)
        }
    }
}
