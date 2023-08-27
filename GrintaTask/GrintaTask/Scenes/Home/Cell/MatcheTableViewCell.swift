//
//  MatcheTableViewCell.swift
//  GrintaTask
//
//  Created by Omnia on 26/08/2023.
//

import UIKit

class MatcheTableViewCell: UITableViewCell {

    @IBOutlet private weak var homeTeamLabel: UILabel!
    @IBOutlet private weak var awayTeamLabel: UILabel!
    
    @IBOutlet private weak var matcheResultView: UIView!
    @IBOutlet private weak var homeTeamScoreLabel: UILabel!
    @IBOutlet private weak var awayTeamScoreLabel: UILabel!
    
    @IBOutlet private weak var matcheTimeView: UIView!
    @IBOutlet private weak var matcheTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bind(matche: MatcheModel) {
        
        matcheResultView.isHidden = true
        matcheTimeView.isHidden = true
        homeTeamLabel.text = matche.homeTeam?.name
        awayTeamLabel.text = matche.awayTeam?.name
        
        if matche.status == "FINISHED" { // show time
            
            matcheResultView.isHidden = false
            homeTeamScoreLabel.text = String(matche.homeTeamTotalScore)
            awayTeamScoreLabel.text = String(matche.awayTeamTotalScore)
            
        } else {
            
            matcheTimeView.isHidden = false
            
            let date = matche.matchDate?.split(separator: "T")
            guard let time = date?.last else {
                return
            }
            matcheTimeLabel.text = TimeDateFormat.convertTime(time: String(time))
        }
    }
}
