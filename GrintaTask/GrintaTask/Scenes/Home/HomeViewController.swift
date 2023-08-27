//
//  HomeViewController.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var matchesTableView: UITableView!
    
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpScreenDesign()
        getMatcheList()
    }

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private
extension HomeViewController {
    
    private func setUpScreenDesign() {
        
        matchesTableView.dataSource = self
        matchesTableView.delegate = self
        matchesTableView.register(UINib(nibName: MatcheTableViewCell.className, bundle: nil),
                                 forCellReuseIdentifier: MatcheTableViewCell.className)
        
    }
    
    private func getMatcheList() {
        
        self.showLoadingIndicator(view: self.view, type: .native)
        
        viewModel?.getMatcheList(completion: {[weak self] (msg, success) in
            
            self?.hideLoadingIndicator()
            
            guard let self = self else { return }
            if success {
                self.matchesTableView.reloadData()
            } else {
                self.showErrorMessage(errorMessage: msg ?? "")
            }
        })
    }
}

// MARK: - TableView DataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.matcheList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatcheTableViewCell.className,
                                                       for: indexPath) as? MatcheTableViewCell else {
            return UITableViewCell()
        }
        guard let matche = viewModel?.matcheList[indexPath.row] else { return UITableViewCell() }
        cell.bind(matche: matche)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
