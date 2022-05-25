//
//  SettingsViewController.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/25.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
