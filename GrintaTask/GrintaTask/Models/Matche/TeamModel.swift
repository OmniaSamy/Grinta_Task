//
//  TeamModel.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation

struct TeamModel: Codable {
    
    var teamID: Int?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        
        case teamID = "id"
        case name = "name"
    }
}
