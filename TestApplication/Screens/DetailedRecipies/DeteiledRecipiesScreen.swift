//
//  DeteiledRecipiesScreen.swift
//  TestApplication
//
//  Created by Дима Губеня on 19.11.2022.
//

import UIKit

    // MARK: - Class DeteiledRecipiesScreen

class DeteiledRecipiesScreen: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    // MARK: - Properties
    
    private let presenter: DetailedRecipiesPresenterProtocol
    private let cellIdentifier: String = String(describing: DeteiledRecipiesCell.self)
    
    // MARK: - Init
    
    init(presenter: DetailedRecipiesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.tabBarController?.tabBar.isHidden = true
        view.showActivityIndicator()
        presenter.getInfo() {
            self.recipeTableView.reloadData()
            self.view.hideActivityIndicatorView()
            UIView.animate(withDuration: 2) {
                self.recipeTableView.layer.opacity = 1
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
           navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Private Extension

private extension DeteiledRecipiesScreen {
    private func setupUI() {
        setupTableView()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let navBar = presenter.type.navTitle
        title = navBar
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupTableView() {
        recipeTableView.layer.opacity = 0
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
        presenter.showDetailedVC(indexPath: indexPath, view: self)
    }
}
