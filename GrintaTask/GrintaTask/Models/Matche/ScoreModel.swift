//
//  ScoreModel.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation

struct ScoreModel: Codable {
    
    var winner: String?
    var duration: String?
    var fullTime: PointModel?
    var halfTime: PointModel?
    var extraTime: PointModel?
    var penalties: PointModel?
    
    enum CodingKeys: String, CodingKey {
        
        case winner = "winner"
        case duration = "duration"
        case fullTime = "fullTime"
        case halfTime = "halfTime"
        case extraTime = "extraTime"
        case penalties = "penalties"
    }
}
