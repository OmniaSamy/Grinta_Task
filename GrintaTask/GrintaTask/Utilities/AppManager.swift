//
//  AppManager.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation
import UIKit

class AppManager {
    
    static var shared: AppManager = AppManager()
    var window: UIWindow?
    
    func setRootView(viewController: UIViewController) {
        window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
    }
}
