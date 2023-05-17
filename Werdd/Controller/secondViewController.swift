//
//  secondViewController.swift
//  Werdd
//
//  Created by Eric Tam on 5/14/23.
//

import UIKit

class secondViewController: UIViewController {
    
    let wordArr: WordAndDef
    
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
