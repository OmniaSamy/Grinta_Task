//
//  SceneDelegate+Extension.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation

extension SceneDelegate {
    
    func disableDarkMode() {
        AppManager.shared.window?.overrideUserInterfaceStyle = .light
    }
}
