//
//  SettingsViewController.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/25.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    private var settingsViewModel = SettingsViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.identifier)
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(didTapDoneButton)
        )
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = settingsViewModel.units[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingsCell.identifier,
            for: indexPath
        ) as? SettingsCell else { return UITableViewCell() }
        cell.configure(settingsItem)
        cell.setupUI()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.units.count
    }
}

// MARK: @objc methods
extension SettingsViewController {
    @objc func didTapDoneButton() {
        dismiss(animated: true)
    }
}
