//
//  RecipiesCell.swift
//  TestApplication
//
//  Created by Дима Губеня on 16.11.2022.
//

import UIKit

class RecipiesCell: UICollectionViewCell {

    @IBOutlet weak var foodTextLabel: UILabel!
    @IBOutlet weak var imageViewLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        backgroundColor = .brown
    }

    func configCell(with title: String, image: MenuActions) {
        foodTextLabel.text = title
        imageViewLabel.image = image.imageView
    }
}

extension RecipiesCell {
    func setupUI() {
        layer.cornerRadius = 8
    }
}
