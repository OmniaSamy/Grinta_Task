//
//  Container.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation
import UIKit

class Container {
    
    class func embedVCInNavController(_ viewController: UIViewController) -> UIViewController {
        let nav = AppNavigationController(rootViewController: viewController)
        return nav
    }
    
    class Matche {
        
        class func getMatcheHomeScreen() -> HomeViewController {
            let view = HomeViewController(viewModel: HomeViewModel())
            return view
        }
    }
}
