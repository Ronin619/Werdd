//
//  wordAndDefinitionViewCell.swift
//  Werdd
//
//  Created by Eric Tam on 5/3/23.
//

import UIKit

class wordAndDefinitionViewCell: UITableViewCell {
    
    static let cellID = "wordsAndDefinitionViewCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "orange")
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let wordLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let speechLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Italic", size: 8)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let definitionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 10)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setUpViews() {
        
        containerView.addSubview(wordLabel)
        containerView.addSubview(speechLabel)
        containerView.addSubview(definitionLabel)
        
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            
            wordLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            wordLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            speechLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 4),
            speechLabel.bottomAnchor.constraint(equalTo: wordLabel.bottomAnchor),
            
            definitionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 5),
            definitionLabel.leadingAnchor.constraint(equalTo: wordLabel.leadingAnchor),
            definitionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4),
            definitionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        ])
    }
    
    func configure(with Words: Words) {
        wordLabel.text = Words.word
        speechLabel.text = Words.speech
        definitionLabel.text = Words.definition
    }
}
