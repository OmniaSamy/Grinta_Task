//
//  Environment.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation

enum Environment {
    
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let apiKey = "API_KEY"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - Plist values
    static let baseURL: String = {
        guard let rootURLstring = Environment.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        let baseUrl = "https://\(rootURLstring)"
        return baseUrl
    }()
    
    static let apiKey: String = {
        guard let apiKey = Environment.infoDictionary[Keys.Plist.apiKey] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return apiKey
    }()
}
