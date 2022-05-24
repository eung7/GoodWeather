//
//  WeatherListViewController.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/24.
//

import UIKit
import SnapKit

class WeatherListViewController: UIViewController {
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
    }
    
    func setupUI() {
        title = "GoodWeather"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(didTapRightBarButton)
        )
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Settings",
            style: .plain,
            target: self,
            action: #selector(didTapLeftBarButton)
        )
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension WeatherListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: WeatherCell.identifier,
            for: indexPath) as? WeatherCell else { return UITableViewCell() }
        cell.setupUI()
        
        return cell
    }
}

extension WeatherListViewController {
    @objc func didTapRightBarButton() {
        
    }
    
    @objc func didTapLeftBarButton() {
        let addVC = UINavigationController(rootViewController: AddWeatherCityViewController())
        addVC.modalPresentationStyle = .fullScreen
        present(addVC, animated: true)
    }
}
