//
//  UIColor+app.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation
import UIKit

extension UIColor {
    
    class var loaderBackgroundColor: UIColor {
        guard let color = UIColor(named: "Loader Background Color") else {
            return UIColor()
        }
        return color
    }
    
    class var primaryColor: UIColor {
        guard let color = UIColor(named: "Primary Color") else {
            return UIColor()
        }
        return color
    }
}
