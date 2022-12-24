//
//  DeteiledRecipiesCell.swift
//  TestApplication
//
//  Created by Дима Губеня on 19.11.2022.
//

import UIKit

class DeteiledRecipiesCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: ImageView!
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        recipeImageView.layer.cornerRadius = recipeImageView.bounds.height / 2
        }
    }


extension DeteiledRecipiesCell {
    func config(with recipe: Recipe) {
        recipeImageView.fetchImage(from: recipe.image)
        recipeNameLabel.text = recipe.label
        descriptionLabel.text = recipe.source
        authorNameLabel.text = recipe.source
    }
}




