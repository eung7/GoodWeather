//
//  AddViewController.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/24.
//

import UIKit
import SnapKit

class AddWeatherCityViewController: UIViewController {
    let textField: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
    let saveButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Save"
        
        let button = UIButton(configuration: config)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Add City"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Close",
            style: .plain,
            target: self,
            action: #selector(didTapCloseButton)
        )
        
        [ textField, saveButton ]
            .forEach { view.addSubview($0) }
        
        textField.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }
        
        saveButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
}

// MARK: @objc methods
extension AddWeatherCityViewController {
    @objc func didTapCloseButton() {
        dismiss(animated: true)
    }
    
    @objc func didTapSaveButton() {
        
    }
}
