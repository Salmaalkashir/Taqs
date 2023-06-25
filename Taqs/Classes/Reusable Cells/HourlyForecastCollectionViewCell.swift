//
//  CollectionViewCell.swift
//  Taqs
//
//  Created by Salma on 22/06/2023.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var timeLabel: UILabel!{
        didSet{
            timeLabel.applyStyle(.subtitle)
        }
    }
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var tempDegreeLabel: UILabel!{
        didSet{
            tempDegreeLabel.applyStyle(.fourth)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
