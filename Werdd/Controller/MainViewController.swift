//
//  ViewController.swift
//  Werdd
//
//  Created by Eric Tam on 4/12/23.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UISearchBarDelegate {
    
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
    
    let collectionContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
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
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width/2.2, height: view.frame.size.width/3.5)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(WordAndDefViewCell.self, forCellWithReuseIdentifier: WordAndDefViewCell.identifier)
        return collectionView
    }()
    
    let refreshButton: RefreshButton = {
        let button = RefreshButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Find a word..."
        searchBar.searchBarStyle = .minimal
        searchBar.isTranslucent = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.setTitle("Search", for: .normal)
        button.setTitleColor(UIColor(named: "faceBookBlue"), for: .normal)
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
        setUpCollectionView()
        setUpSearchBar()
        setUpCollectionContainerView()
        setUpSearchButton()
    }
    
    func setUpHeaderLabel() {
        view.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
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
    
    func setUpCollectionView() {
        view.addSubview(collectionView)
        collectionContainerView.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: collectionContainerView.topAnchor, constant: 80),
            collectionView.leadingAnchor.constraint(equalTo: collectionContainerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: collectionContainerView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: collectionContainerView.bottomAnchor, constant: -20)
        ])
    }
    
    func setUpCollectionContainerView() {
        view.addSubview(collectionContainerView)
        
        NSLayoutConstraint.activate([
            collectionContainerView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
            collectionContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setUpSearchBar() {
        collectionContainerView.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: collectionContainerView.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: collectionContainerView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: collectionContainerView.trailingAnchor, constant: -100),
            searchBar.bottomAnchor.constraint(equalTo: collectionView.topAnchor),
        ])
    }
    
    func setUpSearchButton() {
        collectionContainerView.addSubview(searchButton)
        searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        searchButton.setTitleColor(.white, for: .highlighted)
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: collectionContainerView.topAnchor),
            searchButton.trailingAnchor.constraint(equalTo: collectionContainerView.trailingAnchor, constant: -40),
            searchButton.bottomAnchor.constraint(equalTo: collectionView.topAnchor),
        ])
    }
    
    @objc func refreshButtonPressed() {
        let headers = [
            "X-RapidAPI-Key": APIConstants.key,
            "X-RapidAPI-Host": "wordsapiv1.p.rapidapi.com"
        ]
        
        guard let randomWordURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true") else {
            print("Invalid URL")
            return
        }
        
        var urlRequest = URLRequest(url: randomWordURL)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let randomWord = try JSONDecoder().decode(RandomWord.self, from: data)
                DispatchQueue.main.async { [weak self] in
                    self?.wordLabel.text = randomWord.word
                    self?.wordDefinitionLabel.text = randomWord.results[0].definition
                    self?.wordSpeechLabel.text = randomWord.results[0].partOfSpeech
                }
            }
            catch {
                print("Failed to convert \(error)")
            }
        }.resume()
    }
    
    @objc func searchButtonPressed() {
        let headers = [
            "X-RapidAPI-Key": APIConstants.key,
            "X-RapidAPI-Host": "wordsapiv1.p.rapidapi.com"
        ]

        guard let wordSearchURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/\(searchBar.text ?? "example")")
        else {
            print("Invalid URL")
            return
        }

        var urlRequest = URLRequest(url: wordSearchURL)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let wordFetched = try JSONDecoder().decode(RandomWord.self, from: data)
                print(wordFetched)
            }
            catch {
                print("Failed to convert \(error)")
            }
        }.resume()
    }
    
    struct RandomWord: Codable {
        var word: String
        var results: [results]
    }
    
    struct results: Codable {
        var definition: String
        var partOfSpeech: String
    }
}
    
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wordArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
        WordAndDefViewCell.identifier, for: indexPath) as? WordAndDefViewCell else {
            return UICollectionViewCell()
        }
        cell.contentView.backgroundColor = UIColor(named: "Orange")
        cell.configure(with: wordArr[indexPath.row])
        return cell
    }
}

extension MainViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(WordDetailsViewController(wordArr: wordArr[indexPath.row]), animated: true)
    }
}

