//
//  WeatherListViewController.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/24.
//

import UIKit
import SnapKit

class WeatherListViewController: UIViewController {
    private var weatherListViewModel = WeatherListViewModel()
    private var lastUnitSelection: Unit!
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WeatherCell.self, forCellReuseIdentifier: WeatherCell.identifier)
        tableView.rowHeight = 100
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            lastUnitSelection = Unit(rawValue: value)
        }
    }
    
    func setupUI() {
        title = "GoodWeather"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(didTapPlusButton)
        )
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Settings",
            style: .plain,
            target: self,
            action: #selector(didTapSettingsButton)
        )
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension WeatherListViewController: AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        tableView.reloadData()
    }
}

extension WeatherListViewController: SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)
        }
    }
}

extension WeatherListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: WeatherCell.identifier,
            for: indexPath) as? WeatherCell else { return UITableViewCell() }
        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        cell.configure(weatherVM)
        cell.setupUI()
        
        return cell
    }
}

// MARK: @objc Methods
extension WeatherListViewController {
    @objc func didTapPlusButton() {
        let vc = AddWeatherCityViewController()
        vc.delegate = self
        let addVC = UINavigationController(rootViewController: vc)
        addVC.modalPresentationStyle = .fullScreen
        present(addVC, animated: true)
    }
    
    @objc func didTapSettingsButton() {
        let vc = SettingsViewController()
        vc.delegate = self
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}
