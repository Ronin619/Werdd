//
//  FavoritesTableView.swift
//  Werdd
//
//  Created by Eric Tam on 7/15/23.
//

import UIKit

class FavoritesTableView: UITableViewCell {
    
    // MARK: Cell Identifier
    
    static let identifier = FavoritesTableView.self.description()
    
    // MARK: UI Properties
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "faceBookBlue")
        view.layer.cornerRadius = 20
        return view
    }()
    
    var wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 14)
        label.textColor = .black
        return label
    }()
    
    var partOfSpeechLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Italic", size: 10)
        label.textColor = .black
        return label
    }()
    
    var definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 13)
        label.textColor = .black
        return label
    }()
    
    // MARK: Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        viewSetUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UI Setup
    
    private func viewSetUp() {
        wordLabel.text = "word"
        partOfSpeechLabel.text = "part of speech"
        definitionLabel.text = "definition"
        
        containerView.addSubview(wordLabel)
        containerView.addSubview(partOfSpeechLabel)
        containerView.addSubview(definitionLabel)
        contentView.addSubview(containerView)
        
        contentView.backgroundColor = .lightGray
        
        wordLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        partOfSpeechLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            wordLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            wordLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            partOfSpeechLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 4),
            partOfSpeechLabel.bottomAnchor.constraint(equalTo: wordLabel.bottomAnchor),
            
            definitionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 5),
            definitionLabel.leadingAnchor.constraint(equalTo: wordLabel.leadingAnchor),
            definitionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            definitionLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -12)
        ])
    }
    
    func updateViews(with favoriteWord: WordDetail) {
        wordLabel.text = favoriteWord.word
        partOfSpeechLabel.text = favoriteWord.partOfSpeech
        definitionLabel.text = favoriteWord.definition
    }
}
