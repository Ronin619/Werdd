//
//  wordAndDefinitionViewCell.swift
//  Werdd
//
//  Created by Eric Tam on 5/3/23.
//

import UIKit

class wordAndDefinitionViewCell: UITableViewCell {
    
    static let cellID = "wordsAndDefinitionViewCell"
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let wordLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 10)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let pronounLabel: UILabel = {
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
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func setUpUI() {
        backgroundColor = UIColor(named: "orange")
        
        stackView.addArrangedSubview(wordLabel)
        stackView.addArrangedSubview(pronounLabel)
        stackView.addArrangedSubview(definitionLabel)
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func configure(word: String, pronoun: String, definition: String) {
        wordLabel.text = word
        pronounLabel.text = pronoun
        definitionLabel.text = definition
    }
}
