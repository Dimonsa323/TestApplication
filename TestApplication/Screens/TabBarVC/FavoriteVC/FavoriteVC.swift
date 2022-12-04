//
//  FavoriteVC.swift
//  TestApplication
//
//  Created by Дима Губеня on 03.12.2022.
//

import UIKit

class FavoriteVC: UIViewController {

    private let presenter: FavoritePresenterProtocol
    
    init(presenter: FavoritePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension FavoriteVC {
    
}
