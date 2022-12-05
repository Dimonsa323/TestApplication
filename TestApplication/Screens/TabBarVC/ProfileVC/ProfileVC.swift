//
//  ProfileVC.swift
//  TestApplication
//
//  Created by Дима Губеня on 03.12.2022.
//

import UIKit

class ProfileVC: UIViewController {

    let presenter: ProfilePresenterProtocol
    
    init(presenter: ProfilePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension ProfileVC {
    func setupUI() {
        
    }
}
