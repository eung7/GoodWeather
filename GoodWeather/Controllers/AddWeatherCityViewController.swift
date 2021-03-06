//
//  AddViewController.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/24.
//

import UIKit
import SnapKit

protocol AddWeatherDelegate: AnyObject {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    var addWheaterVM = AddWeatherViewModel()
    weak var delegate: AddWeatherDelegate?
    
    lazy var cityNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Save"
        
        let button = UIButton(configuration: config)
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        
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
        
        [ cityNameTextField, saveButton ]
            .forEach { view.addSubview($0) }
        
        cityNameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(cityNameTextField.snp.bottom).offset(8)
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
        if let city = cityNameTextField.text {
            addWheaterVM.addWeather(for: city) { vm in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true)
            }
        }
    }
}
