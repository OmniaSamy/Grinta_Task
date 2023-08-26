//
//  PointModel.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation

struct PointModel: Codable {
    
    var homeTeam: Int?
    var awayTeam: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case homeTeam = "homeTeam"
        case awayTeam = "awayTeam"
    }
}
