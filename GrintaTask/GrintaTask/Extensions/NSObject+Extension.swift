//
//  NSObject+Extension.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation

extension NSObject {
    
    // return Class Name
    public static var className: String {
        return String(describing: self)
    }
}
