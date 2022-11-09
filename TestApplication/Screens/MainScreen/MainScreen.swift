//
//  MainScreen.swift
//  TestApplication
//
//  Created by Дима Губеня on 09.11.2022.
//

import UIKit

class MainScreen: UIViewController {
    
    private let presenter: MainScreenPresenterProtocol
    
    init(presenter: MainScreenPresenterProtocol) {
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

extension MainScreen {
    func setupUI() {
        
    }
}
