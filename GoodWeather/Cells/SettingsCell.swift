//
//  SettingsCell.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/25.
//

import UIKit
import SnapKit

class SettingsCell : UITableViewCell {
    static let identifier = "SettingsCell"
    
    let label: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    func setupUI() {
        contentView.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
        }
    }
    
    func configure(_ unit: Unit) {
        label.text = unit.displayName
    }
}
