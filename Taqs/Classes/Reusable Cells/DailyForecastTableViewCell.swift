//
//  DailyForecastTableViewCell.swift
//  Taqs
//
//  Created by Fatma on 24/06/2023.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    {
        didSet{
            dayLabel.applyStyle(.fourth)
            dayLabel.text = "Saturday"
        }
    }
    @IBOutlet weak var maxTempLabel: UILabel!  {
        didSet{
            maxTempLabel.applyStyle(.fourth)
            maxTempLabel.text = "26°"
        }
    }
    @IBOutlet weak var minTempLabel: UILabel!  {
        didSet{
            minTempLabel.applyStyle(.fourth)
            minTempLabel.text = "21°"
        }
    }
    
    @IBOutlet weak var weatherIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
