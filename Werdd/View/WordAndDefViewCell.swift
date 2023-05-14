//
//  WordAndDefViewCell.swift
//  Werdd
//
//  Created by Eric Tam on 5/13/23.
//

import UIKit

class WordAndDefViewCell: UICollectionViewCell {
    
    static let identifier = "WordAndDefCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "lightOrange")
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
        label.numberOfLines = 7
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
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(wordLabel)
        containerView.addSubview(speechLabel)
        containerView.addSubview(definitionLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            wordLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            wordLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            speechLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 5),
            speechLabel.bottomAnchor.constraint(equalTo: wordLabel.bottomAnchor),
                        
            definitionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 2),
            definitionLabel.leadingAnchor.constraint(equalTo: wordLabel.leadingAnchor),
            definitionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            definitionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
        ])
    }
    
    func configure(with Words: Words) {
        wordLabel.text = Words.word
        speechLabel.text = Words.speech
        definitionLabel.text = Words.definition
      }
}
