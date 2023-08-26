//
//  Matche.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation

struct MatcheModel: Codable {
    
    var matcheID: Int?
    var matchDate: String?
    var status: String?
    var homeTeam: TeamModel?
    var awayTeam: TeamModel?
    var score: ScoreModel?
    
    
    enum CodingKeys: String, CodingKey {
        
        case matcheID = "id"
        case matchDate = "utcDate"
        case status = "status"
        case homeTeam = "homeTeam"
        case awayTeam = "awayTeam"
        case score = "score"
    }
}


// team names
//game result or time of game if its not played
