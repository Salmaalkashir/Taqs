//
//  FavouriteLocationsTableViewCell.swift
//  Taqs
//
//  Created by Fatma on 28/06/2023.
//

import UIKit

class FavouriteLocationsTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!{
        didSet{
            cityLabel.applyStyle(.title)
            cityLabel.text = "Alexandria"
        }
    }
    @IBOutlet weak var dateLabel: UILabel!{
        didSet{
            dateLabel.applyStyle(.subtitle)
            dateLabel.text = "Tue, 13 June 2:14 am"
        }
    }
    @IBOutlet weak var tempDescriptionLabel: UILabel!{
        didSet{
            tempDescriptionLabel.applyStyle(.subtitle)
            tempDescriptionLabel.text = "Alexandria, Egypt"
        }
    }
    @IBOutlet weak var tempDegreeLabel: UILabel!{
        didSet{
            tempDegreeLabel.applyStyle(.title)
            tempDegreeLabel.text = "31°"
        }
    }
    @IBOutlet weak var minTempLabel: UILabel!{
        didSet{
            minTempLabel.applyStyle(.subtitle)
            minTempLabel.text = "24°"
        }
    }
    @IBOutlet weak var maxTempLabel: UILabel!{
        didSet{
            maxTempLabel.applyStyle(.subtitle)
            maxTempLabel.text = "30° /"
        }
    }
    @IBOutlet weak var weatherIcon: UIImageView!{
        didSet{
            weatherIcon.image = UIImage(named: "sun")
        }
    }
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.masksToBounds = true
            backView.layer.cornerRadius = 20
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
