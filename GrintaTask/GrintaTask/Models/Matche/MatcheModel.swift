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
    
    var homeTeamTotalScore: Int  {
        
        let totalScore = (score?.fullTime?.homeTeam ?? 0) + (score?.halfTime?.homeTeam ?? 0) +
        (score?.extraTime?.homeTeam ?? 0)
        
        if totalScore == 0 {
            return score?.penalties?.homeTeam ?? 0
        } else {
            return totalScore
        }
    }
    
    var awayTeamTotalScore: Int {
        
        let totalScore = (score?.fullTime?.awayTeam ?? 0) + (score?.halfTime?.awayTeam ?? 0) +
        (score?.extraTime?.awayTeam ?? 0)
        
        if totalScore == 0 {
            return score?.penalties?.awayTeam ?? 0
        } else {
            return totalScore
        }
    }
    
    enum CodingKeys: String, CodingKey {
        
        case matcheID = "id"
        case matchDate = "utcDate"
        case status = "status"
        case homeTeam = "homeTeam"
        case awayTeam = "awayTeam"
        case score = "score"
    }
}
