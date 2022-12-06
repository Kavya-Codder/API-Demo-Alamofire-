//
//  CovidDataTableViewCell.swift
//  CovidAPIDemo
//
//  Created by Sunil Developer on 21/11/22.
//

import UIKit

class CovidDataTableViewCell: UITableViewCell {
static let identifier = "CovidDataTableViewCell"
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblStates: UILabel!
    @IBOutlet weak var lblPositive: UILabel!
    @IBOutlet weak var lblNegative: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
