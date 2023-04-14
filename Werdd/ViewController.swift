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
        view.backgroundColor = UIColor(named: "turquoise")
        view.layer.cornerRadius = 20
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "sandGrey")
        
        setUpHeaderLabel()
        setUpWordView()
    }
    
    func setUpHeaderLabel() {
        view.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            headerLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor)
        ])
    }
    
    func setUpWordView() {
        view.addSubview(wordView)
        
        NSLayoutConstraint.activate([
            wordView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            wordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            wordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            wordView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
        ])
    }
}
