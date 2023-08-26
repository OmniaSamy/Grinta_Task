//
//  LoaderProtocol.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation
import  UIKit

protocol LoaderProtocol {
    func showLoadingIndicator(view: UIView, type: LoaderType)
    func hideLoadingIndicator()
}

enum LoaderType {
    case custom, native
}
