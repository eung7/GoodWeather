//
//  ViewController.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/24.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = "GoodWeather"
        
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
    }
}

extension MainViewController {
    @objc func didTapRightBarButton() { }
    @objc func didTapLeftBarButton() {
        let addVC = UINavigationController(rootViewController: AddViewController())
        addVC.modalPresentationStyle = .fullScreen
        present(addVC, animated: true)
    }
}
