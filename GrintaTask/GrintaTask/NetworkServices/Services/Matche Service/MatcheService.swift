//
//  MatcheService.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation
import Moya

enum MatcheService {
    case getMatcheList
}

extension MatcheService: TargetType {
    
    var baseURL: URL {
        return URL(string: NetworkManager.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getMatcheList:
            return "/v2/competitions/2021/matches"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMatcheList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
            
        case .getMatcheList:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}

