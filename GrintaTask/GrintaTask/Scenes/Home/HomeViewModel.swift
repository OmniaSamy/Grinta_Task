//
//  HomeViewModel.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import Foundation

protocol HomeViewModelProtocol: BaseViewModelProtocol {
    
    func getMatcheList(completion: @escaping BlockWithMessageAndBool)
    var matcheList: [MatcheModel] { set get }
}

class HomeViewModel: HomeViewModelProtocol {
    
    var matcheList: [MatcheModel] = []
    
    init() { }
    
    func getMatcheList(completion: @escaping BlockWithMessageAndBool) {
        
        NetworkManager.shared.getMatcheList(completion: {[weak self] (result: Result<NetworkResponse<MatcheModel>, NetworkError>, _) in
            
            switch result {
            case .success(let data):
                
                print("data \(data)")
                self?.matcheList = data.matches ?? []
                completion("sucess", true)
                
            case .failure(let error):
                print("error \(error)")
                completion(error.errorMessage(), false)
            }
        })
    }
}
