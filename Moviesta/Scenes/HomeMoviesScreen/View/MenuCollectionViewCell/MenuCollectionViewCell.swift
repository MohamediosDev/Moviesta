//
//  MenuCollectionViewCell.swift
//  Moviesta
//
//  Created by SODA on 22/01/2022.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var menuNameLabel: UILabel!

    static let cellID = "MenuCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        menuNameLabel.alpha = 0.6
    }
    
    override var isSelected: Bool {
        didSet {
            menuNameLabel.alpha = isSelected ? 1.0 : 0.6
        }
    }

}
