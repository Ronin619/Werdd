//
//  FavoritesViewController.swift
//  Werdd
//
//  Created by Eric Tam on 6/18/23.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    private let dataManager: DataManager
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "lightGrey")
        return tableView
    }()
    
    init(dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        setUpTableView()
        setUpNavigation()
        
        tableView.dataSource = self
        
        super.viewDidLoad()
    }
    
    private func setUpTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setUpNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let textAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttribute
        
        navigationItem.title = "Favorites"
    }
    
    private func fetchFavoriteWords() {
        dataManager
    }
    
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:
         Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
         IndexPath) -> UITableViewCell {
         let cell = UITableViewCell()
         cell.backgroundColor = UIColor(named: "lightOrange")
         return cell
    }
}
