//
//  RecipiesCell.swift
//  TestApplication
//
//  Created by Дима Губеня on 16.11.2022.
//

import UIKit

    // MARK: - Class RecipiesCell

class RecipiesCell: UICollectionViewCell {
    
    @IBOutlet weak var foodTextLabel: UILabel!
    @IBOutlet weak var imageViewLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func configCell(type: MenuActions) {
        foodTextLabel.text = type.title
        imageViewLabel.image = UIImage(named: type.sectionImage)
    }
}

extension RecipiesCell {
    private func setupUI() {
        layer.cornerRadius = 8
    }
}
