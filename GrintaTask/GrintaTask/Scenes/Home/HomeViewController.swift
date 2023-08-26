//
//  HomeViewController.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        callApi()
    }


    func callApi() {
        
        NetworkManager.shared.getMatcheList(completion: {[weak self] (result: Result<NetworkResponse<MatcheModel>, NetworkError>, _) in
            
            switch result {
            case .success(let data):
                print("data \(data)")
//                self?.movieList.append(contentsOf: data.results ?? [])
                
            case .failure(let error):
                print("error \(error)")
            }
        })
    }
}
