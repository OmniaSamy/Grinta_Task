//
//  NetworkManager.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation
import Moya

extension NetworkManager {
    
    func getMatcheList(completion: @escaping(_ result: Swift.Result<NetworkResponse<MatcheModel>, NetworkError>,
                                            _ statusCode: Int?) -> Void) {
        
        provider.request(MultiTarget(MatcheService.getMatcheList)) { result in
            self.parseResponse(moyaResult: result, completion: completion)
        }
    }
}
