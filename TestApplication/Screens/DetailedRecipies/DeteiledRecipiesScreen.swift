//
//  DeteiledRecipiesScreen.swift
//  TestApplication
//
//  Created by Дима Губеня on 19.11.2022.
//

import UIKit

class DeteiledRecipiesScreen: UIViewController {

    
    @IBOutlet weak var recipeTableView: UITableView!
    
    private let presenter: DetailedRecipiesPresenterProtocol
    private let cellIdentifier: String = String(describing: DeteiledRecipiesCell.self)
    
    init(presenter: DetailedRecipiesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getInfo() {
            self.recipeTableView.reloadData()
        }
        setupUI()
    }

}

extension DeteiledRecipiesScreen {
    private func setupUI() {
        recipeTableView.dataSource = self
        recipeTableView.delegate = self
        recipeTableView.register(.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
}

extension DeteiledRecipiesScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.recipesFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipeTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DeteiledRecipiesCell
        let recepiesFood = presenter.recipesFood[indexPath.row]
        cell.config(with: recepiesFood.recipe)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showDetailedVC(indexPath: indexPath)
        
    }
}
