//
//  CollectionViewCell.swift
//  Taqs
//
//  Created by Salma on 22/06/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var imgcollection: UIImageView!
    
    @IBOutlet weak var degree: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
