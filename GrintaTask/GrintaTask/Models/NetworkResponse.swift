//
//  NetworkResponse.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation

struct NetworkResponse<T: Codable>: Codable {
    
    var matches: [MatcheModel]?
    var errors: [String]?
}
