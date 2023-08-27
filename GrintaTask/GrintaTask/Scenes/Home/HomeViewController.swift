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
        matchesTableView.register(UINib(nibName: MatcheHeaderView.className, bundle: nil),
                                  forHeaderFooterViewReuseIdentifier: MatcheHeaderView.className)
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.matcheListGroubed.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dict = viewModel?.matcheListGroubed[section]
        return dict?.matchlist?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatcheTableViewCell.className,
                                                       for: indexPath) as? MatcheTableViewCell else {
            return UITableViewCell()
        }
        guard let matche = viewModel?.matcheListGroubed[indexPath.section].matchlist?[indexPath.row] else { return UITableViewCell() }
        cell.bind(matche: matche)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: MatcheHeaderView.className) as? MatcheHeaderView,
              let headerDate = viewModel?.matcheListGroubed[section].date
        else { return nil }
        
        header.bind(date: headerDate)
        return header
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
