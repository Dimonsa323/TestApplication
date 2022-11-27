//
//  DeteiledRecipiesCell.swift
//  TestApplication
//
//  Created by Дима Губеня on 19.11.2022.
//

import UIKit

class DeteiledRecipiesCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}

extension DeteiledRecipiesCell {
    
    func config(with recipe: Recipe) {
        recipeImageView.loadAsyncImage(image: recipe.image, closure: { image in
            self.recipeImageView.image = image
        })
        recipeNameLabel.text = recipe.label
        descriptionLabel.text = recipe.source
        authorNameLabel.text = recipe.source
    }
}
