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
    var matcheListGroubed: [SectionItem] { set get }
}

class HomeViewModel: HomeViewModelProtocol {
    
    var matcheList: [MatcheModel] = []
    var matcheListGroubed: [SectionItem] = []
    init() { }
    
    func getMatcheList(completion: @escaping BlockWithMessageAndBool) {
        
        NetworkManager.shared.getMatcheList(completion: {[weak self] (result: Result<NetworkResponse<MatcheModel>, NetworkError>, _) in
            
            switch result {
            case .success(let data):
                
                print("data \(data)")
                self?.matcheList = data.matches ?? []
                self?.groupMatcheList()
                completion("sucess", true)
                
            case .failure(let error):
                print("error \(error)")
                completion(error.errorMessage(), false)
            }
        })
    }
    
    func groupMatcheList() {
        
        var datesArray = matcheList.map {
            let date = ($0.matchDate ?? "").split(separator: "T").first
            return String(date ?? "")
        } // return array of date
        
        datesArray = Array(Set(datesArray)) // to remove duplication
        
        var result: [ SectionItem ] = []
        
        datesArray.forEach({
            let dateKey = $0
            let filteredList = self.matcheList.filter({
                
                let matcheDate = ($0.matchDate ?? "").split(separator: "T").first
                return dateKey ==  String(matcheDate ?? "")
            })
            
            let section = SectionItem(date: dateKey, matchlist: filteredList)
            result.append(section)
        })
        
        result.sort(by: {
            TimeDateFormat.convertStringToDate(date: $0.date ?? "") <  TimeDateFormat.convertStringToDate(date: $1.date ?? "")
        })
        self.matcheListGroubed = result
    }
}


struct SectionItem {
    
    var date: String?
    var matchlist: [MatcheModel]?
}
