//
//  secondViewController.swift
//  Werdd
//
//  Created by Eric Tam on 5/14/23.
//

import UIKit

class wordDetailsViewController: UIViewController {
    
    let wordArr: WordAndDef
    
    // Mark: UI Properties
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
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
    
    // Mark: Initializer
    init(wordArr: WordAndDef) {
        self.wordArr = wordArr
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "lightGrey")
        
        navigationSetUp()
    }
    
    private func navigationSetUp() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let textAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttribute
        
        navigationItem.title = wordArr.word
    }
}
