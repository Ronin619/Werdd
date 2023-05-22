//
//  wordInfoView.swift
//  Werdd
//
//  Created by Eric Tam on 5/16/23.
//

import UIKit

class wordInfoView: UIView {

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .gray
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 20
        return stackView
    }()
    
    let descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let speechLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.isHidden = true
        label.textAlignment = .left
        label.font = UIFont(name: "Roboto-Regular", size: 12)
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.isHidden = true
        label.textAlignment = .left
        label.font = UIFont(name: "Roboto-Italic", size: 12)
        return label
    }()
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.font = UIFont(name: "Roboto-Italic", size: 20)
        return label
    }()
    
    let word: String?
    let speech: String?
    let definition: String?
    
    // Mark: - Initializer
    init(isHidden: Bool = false, backgroundColor: UIColor? = .white, word: String?, speech: String?, definition: String) {
        self.word = word
        self.speech = speech
        self.definition = definition
        
        super.init(frame: .zero)
        
        self.isHidden = isHidden
        self.backgroundColor = backgroundColor
    }
    // Mark: - this is to be here even though we don't need it (mainly for ObjC)
    required init?(coder: NSCoder) {
        return nil
    }
    
    func setUpUIView() {
        layer.cornerRadius = 20
        
        stackView.addSubview(definitionView)
        stackView.addSubview(synonymsView)
        stackView.addSubview(antonymsView)
        stackView.addSubview(exampleUsageView)
        
        NSLayoutConstraint.activate([
            
            definitionView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 40),
            definitionView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            definitionView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -30),
            definitionView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.2),
            
            synonymsView.topAnchor.constraint(equalTo: definitionView.bottomAnchor, constant: 20),
            synonymsView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            synonymsView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -30),
            synonymsView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.13),
            
            antonymsView.topAnchor.constraint(equalTo: synonymsView.bottomAnchor, constant: 20),
            antonymsView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            antonymsView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -30),
            antonymsView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.13),
            
            exampleUsageView.topAnchor.constraint(equalTo: antonymsView.bottomAnchor, constant: 20),
            exampleUsageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            exampleUsageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -30),
            exampleUsageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.2),
        ])
    }
}
