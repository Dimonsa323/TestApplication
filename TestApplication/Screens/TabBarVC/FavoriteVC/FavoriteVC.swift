//
//  FavoriteVC.swift
//  TestApplication
//
//  Created by Дима Губеня on 03.12.2022.
//

import UIKit

class FavoriteVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let presenter: FavoritePresenterProtocol
    private let favoriteCell: String = String(describing: FavoriteCell.self)
    
    init(presenter: FavoritePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.showActivityIndicator()
        presenter.getInfo {
            self.tableView.reloadData()
            UIView.animate(withDuration: 2) {
                self.tableView.layer.opacity = 1
            }
            view.hideActivityIndicatorView()
        }
    }
}

extension FavoriteVC {
    func setupUI() {
        setupTableView()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        title = "Favorite"
        
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(.init(nibName: favoriteCell, bundle: nil), forCellReuseIdentifier: favoriteCell)
    }
}

extension FavoriteVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.modelRecipe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: favoriteCell, for: indexPath) as! FavoriteCell
        let recepiesFood = presenter.modelRecipe[indexPath.row]
        cell.config(with: recepiesFood)
        
        return cell
    }
}
