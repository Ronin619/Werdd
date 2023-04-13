//
//  ViewController.swift
//  Werdd
//
//  Created by Eric Tam on 4/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Werdd."
        return label
    }()

    let wordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        view.layer.cornerRadius = 20
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        view.addSubview(headerLabel)
        view.addSubview(wordView)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            wordView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            wordView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wordView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            wordView.heightAnchor.constraint(equalToConstant: 300),
            wordView.widthAnchor.constraint(equalToConstant: 300),
        ])
    }


}

