//
//  FavoritesViewController.swift
//  Werdd
//
//  Created by Eric Tam on 6/18/23.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate {
    
    // MARK: Properties
    
    private let dataManager: DataManager
    private var favoriteWords: [WordDetail]?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FavoritesTableView.self, forCellReuseIdentifier: FavoritesTableView.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    //MARK: Initializers
    
    init(dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigation()
        fetchFavoriteWords()
        addSubViews()
    }
    
    // MARK: Methods
    
    private func addSubViews() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setUpNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let textAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttribute
        
        navigationItem.title = "Favorites"
    }
    
    private func fetchFavoriteWords() {
        dataManager.fetchAllFavoriteWords {
            favoriteWords in self.favoriteWords = favoriteWords
        }
    }
    
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:
         Int) -> Int {
        return favoriteWords?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let favoriteWords = favoriteWords?[indexPath.row] else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableView.identifier, for: indexPath) as! FavoritesTableView
  
        cell.updateViews(with: favoriteWords)
         return cell
    }
}

