//
//  AppNavigationController.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation
import UIKit

class AppNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearBackBarButtonTitle()
    }
}

extension AppNavigationController {
    
    func clearBackBarButtonTitle() {
        
        self.navigationBar.tintColor = .primaryColor
        
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: UIControl.State.highlighted)
        
    }
}
