//
//  TableViewCell.swift
//  Taqs
//
//  Created by Salma on 22/06/2023.
//

import UIKit

class WeatherIndicatorsTableViewCell: UITableViewCell {

    @IBOutlet weak var indicatorIcon: UIImageView!
    @IBOutlet weak var indicatorLabel: UILabel!{
        didSet{
            indicatorLabel.applyStyle(.fourth)
        }
    }
    @IBOutlet weak var indicatorValueLabel: UILabel!{
        didSet{
            indicatorValueLabel.applyStyle(.fourth)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
 extension WeatherIndicatorsTableViewCell{
     func createCell(rowIndex: Int)
    {
        var a : Indicators?
        switch rowIndex{
        case 0:
            a = .uvIndix
        case 1:
            a = .sunrise
        case 2:
            a = .sunset
        case 3:
            a = .wind
        case 4:
            a = .humidity
        case 5:
            a = .clouds
        default:
            break
        }
        
        indicatorLabel.text = a?.indicator
        indicatorIcon.image = a?.icon
    }
}

