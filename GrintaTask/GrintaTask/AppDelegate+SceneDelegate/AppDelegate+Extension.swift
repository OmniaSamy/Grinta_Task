//
//  AppDelegate+Extension.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation

extension AppDelegate {
    
    func setRoot() {
        
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//
//        if UserManager.isLogedIn() { // logged in user
//            let homeVC = AppTabBarController()
//            self.window?.rootViewController = homeVC
//        } else {
//            let loginVC = Container.embedVCInNavController(Container.getLoginViewController())
//            self.window?.rootViewController = loginVC
//        }
//        self.window?.makeKeyAndVisible()
    }
    
    func initNetwork() {
        
        let defaults = NetworkDefaults(baseUrl: Environment.baseURL,
                                       apiKey: Environment.apiKey
        )

        NetworkManager.shared = NetworkManager(config: defaults)

        print(Environment.baseURL)
    }
}
