//
//  AddViewController.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/24.
//

import UIKit

class AddViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        title = "Add City"
    }
}
