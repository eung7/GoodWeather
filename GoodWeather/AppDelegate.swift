//
//  AppDelegate.swift
//  GoodWeather
//
//  Created by 김응철 on 2022/05/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        natvigationAttributes()
        
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    func natvigationAttributes() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        
        UINavigationBar.appearance().standardAppearance.largeTitleTextAttributes =  [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance.titleTextAttributes =  [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UIBarButtonItem.appearance().tintColor = .systemBackground
    }
}

