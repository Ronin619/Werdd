//
//  ViewController.swift
//  Werdd
//
//  Created by Eric Tam on 4/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    var wordsAndDefinitionData = WordsAndDefinitions()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Werdd."
        label.font = UIFont(name: "Roboto-Bold", size: 32)
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "turquoise")
        view.layer.cornerRadius = 20
        return view
    }()
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Programming"
        label.font = UIFont(name: "Roboto-Bold", size: 24)
        return label
    }()
    
    let wordSpeechLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "noun"
        label.font = UIFont(name: "Roboto-Italic", size: 12)
        return label
    }()
    
    let wordDefinitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "creating a sequence of instructions to enable the computer to do something."
        label.font = UIFont(name: "Roboto-Regular", size: 18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "mint")
        tableView.dataSource = self
        tableView.register(wordAndDefinitionViewCell.self, forCellReuseIdentifier: wordAndDefinitionViewCell.cellID)
        return tableView
    }()
    
    let refreshButton: RefreshButton = {
        let button = RefreshButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "lightGrey")
        
        setUpHeaderLabel()
        setUpContainerView()
        setUpWordLabel()
        setUpWordDefinitionLabel()
        setUpWordSpeechLabel()
        setUpButton()
        setUpTableView()
    }
    
    func setUpHeaderLabel() {
        view.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            headerLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor)
        ])
    }
    
    func setUpContainerView() {
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
        ])
    }
    
    func setUpWordLabel() {
        containerView.addSubview(wordLabel)
        
        NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            wordLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        ])
    }
    
    func setUpWordDefinitionLabel() {
        containerView.addSubview(wordDefinitionLabel)
        
        NSLayoutConstraint.activate([
            wordDefinitionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 10),
            wordDefinitionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            wordDefinitionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            wordDefinitionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    func setUpWordSpeechLabel() {
        containerView.addSubview(wordSpeechLabel)
        
        NSLayoutConstraint.activate([
            wordSpeechLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            wordSpeechLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 10),
            wordSpeechLabel.bottomAnchor.constraint(equalTo: wordLabel.bottomAnchor)
        ])
    }
    
    func setUpButton() {
        containerView.addSubview(refreshButton)
        
        refreshButton.addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            refreshButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            refreshButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
        ])
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func refreshButtonPressed() {
        let randomWord = randomWord()
        updateWordView(withWord: randomWord)
    }
    
    func randomWord() -> wordBank? {
        return wordArr.randomElement()
    }
    
    func updateWordView(withWord word: wordBank?) {
        wordLabel.text = word?.word
        wordDefinitionLabel.text = word?.definition
        wordSpeechLabel.text = word?.speech
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:
        Int) -> Int {
        return wordsAndDefinitionData.content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: wordAndDefinitionViewCell.cellID, for: indexPath) as? wordAndDefinitionViewCell else {
            return UITableViewCell()
        }
        
        var content = cell.defaultContentConfiguration()
      
        content.text = wordsAndDefinitionData.content[indexPath.row].word
        content.secondaryText = wordsAndDefinitionData.content[indexPath.row].definition
 
       cell.contentConfiguration = content
        
        
        return cell
    }
}


