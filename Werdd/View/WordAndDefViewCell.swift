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
        view.layer.cornerRadius = 20
        return view
       }()
    
    private let wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    private let speechLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Italic", size: 8)
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    private let definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 10)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 5
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
        
//        wordLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        speechLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            wordLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            wordLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            wordLabel.heightAnchor.constraint(equalToConstant: 24),

            speechLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 4),
            speechLabel.centerYAnchor.constraint(equalTo: wordLabel.centerYAnchor),
                        
            definitionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 5),
            definitionLabel.leadingAnchor.constraint(equalTo: wordLabel.leadingAnchor),
            definitionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4),
            definitionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        ])
    }
    
    // Mark: this function fills the cells in the collection view.
    
    func configure(with WordsAndDef: WordAndDef) {
        wordLabel.text = WordsAndDef.word
        speechLabel.text = WordsAndDef.speech
        definitionLabel.text = WordsAndDef.definition
      }
}
