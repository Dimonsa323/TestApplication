//
//  DeteiledRecipiesCell.swift
//  TestApplication
//
//  Created by Дима Губеня on 19.11.2022.
//

import UIKit

class DetailedRecipiesCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}

extension DetailedRecipiesCell {
    
    func config(with recipe: Recipe) {
        recipe.loadAsyncImage(image: recipe.image, closure: { image in
            self.recipeImageView.image = image
        })
        recipeNameLabel.text = recipe.label
        descriptionLabel.text = recipe.source
        authorNameLabel.text = recipe.source
    }
}
