//
//  IngredientsVC.swift
//  TestApplication
//
//  Created by Дима Губеня on 27.11.2022.
//

import UIKit

class IngredientsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: ImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
  //  @IBOutlet weak var titleLabel: UILabel!
    
    private let presenter: IngredientsVCPresenterProtocol
    private let ingredientCell: String = String(describing: ingredientsCell.self)
    
    init(presenter: IngredientsVCPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        imageView.layer.cornerRadius = 8
        self.tabBarController?.tabBar.isHidden = true
    }
}

extension IngredientsVC {
    func setupUI() {
        setupTableView()
        setupNavigationController()
        setupDetailRecipe()
        presenter.fetchRequest {
            self.tableView.reloadData()
        }
    }

    func setupDetailRecipe() {
        imageView.fetchImage(from: presenter.detailedRecipe.image)

      //  titleLabel.text = "Ingredients"
        caloriesLabel.text = String(format: "Calories: %.0f",
                                    presenter.detailedRecipe.calories) + " " + "Cal"
        weightLabel.text = String(format: "Weight: %.0f",
                                  presenter.detailedRecipe.totalWeight) + " " + "grams"
        timeLabel.text = String(format: "Time: %.0f" ,
                                presenter.detailedRecipe.totalTime) + " " + "min"
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(.init(nibName: ingredientCell, bundle: nil), forCellReuseIdentifier: ingredientCell)
    }
    
    func setupNavigationController() {
        setupNavBar()
        title = presenter.detailedRecipe.label
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
   func setupNavBar() {
       let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Vector"), style: .plain, target: self, action: #selector(didTapUser))
       navigationItem.rightBarButtonItem = rightBarButtonItem
    }
                                               
    @objc
    func didTapUser() {
        presenter.saveUserInDataBase(recipe: presenter.detailedRecipe) {
            self.tableView.reloadData()
        }
    }
}

extension IngredientsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.detailedRecipe.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ingredientCell, for: indexPath) as! ingredientsCell
        let ingredientFood = presenter.detailedRecipe.ingredients[indexPath.row]
        cell.config(with: ingredientFood)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let titleButton = UIButton()
        titleButton.backgroundColor = UIColor(named: "Rose")
        titleButton.setTitleColor(.black, for: .normal)
        titleButton.setTitle("Full Recipe", for: .normal)
        titleButton.layer.cornerRadius = 6
        
        return titleButton
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.init(name: "SFProText-Semibold", size: 34)
        titleLabel.backgroundColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        titleLabel.text = "Ingredients"
        
        return titleLabel
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 32
    }
}
