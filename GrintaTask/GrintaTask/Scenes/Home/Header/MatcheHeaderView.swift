//
//  MatcheHeaderView.swift
//  GrintaTask
//
//  Created by Omnia on 27/08/2023.
//

import Foundation
import UIKit

class MatcheHeaderView: UITableViewHeaderFooterView {

    @IBOutlet private weak var dateLabel: UILabel!
    
    func bind(date: String) {
        dateLabel.text = date
    }
}

