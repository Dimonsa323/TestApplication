//
//  FavoriteCell.swift
//  TestApplication
//
//  Created by Дима Губеня on 05.12.2022.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    @IBOutlet weak var imageFavoriteView: ImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        imageFavoriteView.layer.cornerRadius = imageFavoriteView.bounds.height / 2
        if imageFavoriteView.image == nil {
            imageFavoriteView.showActivityIndicator()
        }
    }
}

extension FavoriteCell {
    
    func config(with recipe: Recipe) {
        imageFavoriteView.fetchImage(from: recipe.image)
        self.hideActivityIndicatorView()
        nameLabel.text = recipe.label
        infoLabel.text = recipe.source
        authorLabel.text = recipe.source
    }
}
