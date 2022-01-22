//
//  CatogeryCell.swift
//  Moviesta
//
//  Created by SODA on 22/01/2022.
//

import UIKit

class CatogeryCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var catogeryLabel: UILabel!
    
    static let cellID = "CatogeryCell"
    override func awakeFromNib() {
        super.awakeFromNib()
      
        backView.backgroundColor = .clear
        backView.layer.borderColor = AppColor.borderColor.Color.cgColor
        backView.layer.cornerRadius = backView.frame.height / 2
        backView.clipsToBounds = true
        backView.layer.borderWidth = 1.5
    }

    func setupCell(data: Genre) {
        catogeryLabel.text = data.name ?? ""
    }
}
