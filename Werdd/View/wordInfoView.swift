//
//  wordInfoView.swift
//  Werdd
//
//  Created by Eric Tam on 5/16/23.
//

import UIKit

class WordInfoView: UIView {

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
        return label
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
    let descriptionText: String?
    
    // Mark: - Initializer
    init(isHidden: Bool = false, backgroundColor: UIColor? = .white, word: String?, speech: String?, descriptionText: String) {
        self.word = word
        self.speech = speech
        self.descriptionText = descriptionText
        
        super.init(frame: .zero)
        
        self.isHidden = isHidden
        self.backgroundColor = backgroundColor
        
        setUpUIView()
    }
    // Mark: - this is to be here even though we don't need it (mainly for ObjC)
    required init?(coder: NSCoder) {
        return nil
    }
    
    func setUpUIView() {
        layer.cornerRadius = 20
        
        wordLabel.text = word
        speechLabel.text = speech
        descriptionLabel.text = descriptionText
        
        speechLabel.isHidden = speech == nil
        
        addDescriptionStackView()
        addWordLabel()
        addStackView()
    }
    
    private func addDescriptionStackView() {
        descriptionStackView.addArrangedSubview(speechLabel)
        descriptionStackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(descriptionStackView)
    }
    
    private func addWordLabel() {
        stackView.addArrangedSubview(wordLabel)
    }
    
    private func addStackView() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
}
