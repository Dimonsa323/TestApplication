//
//  MainScreen.swift
//  TestApplication
//
//  Created by Дима Губеня on 09.11.2022.
//

import UIKit

    // MARK: - Class

class MainScreen: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var enterUIButton: UIButton!
    @IBOutlet weak var cookLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    private let presenter: MainScreenPresenterProtocol
    
    // MARK: - Init
    
    init(presenter: MainScreenPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterUIButton.layer.cornerRadius = 6
    }
}

    // MARK: - Private Extension

extension MainScreen {
    
    @IBAction func enterButton() {
        presenter.showTabBarVC(view: self)
    }
}
