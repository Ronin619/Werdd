//
//  FavoritesViewController.swift
//  Werdd
//
//  Created by Eric Tam on 6/18/23.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        setUpUI()
        setUpNavigation()
        
        view.backgroundColor = UIColor(named: "lightGrey")
        super.viewDidLoad()
    }
    
    private func setUpUI() {
        addScrollView()
    }
    
    private func setUpNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let textAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttribute
        
        navigationItem.title = "Favorites"
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        
        scrollView.backgroundColor = .darkGray
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}
