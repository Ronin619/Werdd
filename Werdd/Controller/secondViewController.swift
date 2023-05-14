//
//  secondViewController.swift
//  Werdd
//
//  Created by Eric Tam on 5/14/23.
//

import UIKit

class secondViewController: UIViewController {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let definitionView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "greyBlue")
        view.layer.cornerRadius = 20
        return view
    }()
    
    let synonymsView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "jungle")
        view.layer.cornerRadius = 20
        return view
    }()
    
    let antonymsView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "coral")
        view.layer.cornerRadius = 20
        return view
    }()
    
    let exampleUsageView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "lightOrange")
        view.layer.cornerRadius = 20
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
