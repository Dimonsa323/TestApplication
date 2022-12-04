//
//  Cell.swift
//  TestApplication
//
//  Created by Дима Губеня on 27.11.2022.
//

import UIKit

class ingredientsCell: UITableViewCell {
    
    @IBOutlet weak var ingredientsImageView: ImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        ingredientsImageView.showActivityIndicator()
    }
}

extension ingredientsCell {
    func config(with recipe: Ingredients) {
        ingredientsImageView.fetchImage(from: recipe.image ?? "person.fill")
        nameLabel.text = recipe.text
        self.ingredientsImageView.hideActivityIndicatorView()
    }
}
