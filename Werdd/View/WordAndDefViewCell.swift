//
//  WordAndDefViewCell.swift
//  Werdd
//
//  Created by Eric Tam on 5/13/23.
//

import UIKit

class WordAndDefViewCell: UICollectionViewCell {
    
    static let identifier = "WordAndDefCell"
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
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
        label.textAlignment = .right
        return label
    }()
    
    private let definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 10)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func setUpUI() {
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(wordLabel)
        stackView.addArrangedSubview(speechLabel)
        stackView.addArrangedSubview(definitionLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16),
            
            wordLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            wordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                        
            speechLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 4),
            speechLabel.bottomAnchor.constraint(equalTo: wordLabel.bottomAnchor),
                        
            definitionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 5),
            definitionLabel.leadingAnchor.constraint(equalTo: wordLabel.leadingAnchor),
            definitionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            definitionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    func configure(with Words: Words) {
        wordLabel.text = Words.word
        speechLabel.text = Words.speech
        definitionLabel.text = Words.definition
      }
}
