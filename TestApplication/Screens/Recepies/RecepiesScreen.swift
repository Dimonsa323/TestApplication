//
//  RecepiesScreen.swift
//  TestApplication
//
//  Created by Дима Губеня on 11.11.2022.
//

import UIKit

class RecepiesScreen: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let presenter: RecepiesScreenPresenterProtocol
    private let createCell: String = String(describing: RecipiesCell.self)
    
    init(presenter: RecepiesScreenPresenterProtocol) {
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

extension RecepiesScreen {
    func setupUI() {
        setupCollectionView()
        setupNavigationController()
        setupTabBarController()
    }
    
    func setupTabBarController() {
        
        navigationController?.tabBarController
    }
    
    func setupNavigationController() {
        title = "Recipies"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupCollectionView() {
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(.init(nibName: createCell, bundle: nil), forCellWithReuseIdentifier: createCell)
    }
}

extension RecepiesScreen: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.showNextVC(indexPath: indexPath, view: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.menuActions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: createCell, for: indexPath) as! RecipiesCell
        
        let menuActions = presenter.menuActions[indexPath.item]
        
        cell.configCell(type: menuActions)
        
        return cell
    }
}

extension RecepiesScreen: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 32, height: 150)
    }
}

