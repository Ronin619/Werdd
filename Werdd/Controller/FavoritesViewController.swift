//
//  FavoritesViewController.swift
//  Werdd
//
//  Created by Eric Tam on 6/18/23.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    private let dataManager: DataManager
    private var favoriteWords: [WordDetail]?
    
    init(dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigation()
        fetchFavoriteWords()
        
        tableView.dataSource = self
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesViewController.identifier, for: indexPath) as! FavoritesViewController
         cell.backgroundColor = UIColor(named: "lightOrange")
         return cell
    }
}
