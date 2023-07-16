//
//  secondViewController.swift
//  Werdd
//
//  Created by Eric Tam on 5/14/23.
//

import UIKit

class WordDetailsViewController: UIViewController {
    
    // Mark: properties
    let searchedResult: results
    let searchedWord: String
    let dataManager: DataManager
  
    // Mark: UI Properties
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }()
        
    lazy var definitionView: WordInfoView = {
        let wordInfoView = WordInfoView(
            backgroundColor: UIColor(named: "greyBlue"),
            word: "Definition", speech: searchedResult.partOfSpeech,
            descriptionText: searchedResult.definition
        )
        wordInfoView.translatesAutoresizingMaskIntoConstraints = false
        return wordInfoView
    }()
    
    lazy var synonymsView: WordInfoView = {
        let hideSynonyms = searchedResult.synonyms == nil
        
        let synonymText = searchedResult.synonyms?.joined(separator: ", ")
        let wordInfoView = WordInfoView(
            isHidden: hideSynonyms,
            backgroundColor: UIColor(named: "jungle"),
            word: "Synonyms",
            speech: nil,
            descriptionText: synonymText ?? "N/A"
        )
        wordInfoView.translatesAutoresizingMaskIntoConstraints = false
        return wordInfoView
    }()
    
    lazy var antonymsView: WordInfoView = {
        let hideAntonyms = searchedResult.antonyms == nil
        let antonymText = searchedResult.antonyms?.joined(separator: ", ")
        let wordInfoView = WordInfoView(
            isHidden: hideAntonyms,
            backgroundColor: UIColor(named: "coral"),
            word: "Antonyms",
            speech: nil,
            descriptionText: antonymText ?? "N/A"
        )
        wordInfoView.translatesAutoresizingMaskIntoConstraints = false
        return wordInfoView
    }()
    
    lazy var exampleUsageView: WordInfoView = {
        let hideExamples = searchedResult.examples == nil
        let exampleText = searchedResult.examples?.joined(separator: "\n\n")
        let wordInfoView = WordInfoView(
            isHidden: hideExamples,
            backgroundColor: UIColor(named: "gold"),
            word: "Example Usage",
            speech: nil,
            descriptionText: exampleText ?? "N/A"
        )
        wordInfoView.translatesAutoresizingMaskIntoConstraints = false
        return wordInfoView
    }()
    
    // Mark: Initializer
    init(searchedResult: results, searchedWord: String, dataManager: DataManager = DataManager()) {
        self.searchedResult = searchedResult
        self.searchedWord = searchedWord
        self.dataManager = dataManager
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // Mark: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "lightGrey")
        
        setUpUI()
        setUpNavigation()
    }
    
    // MARK: UI Setup
    
    private func setUpNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttribute
        navigationItem.title = searchedWord
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .done, target: self, action: #selector(addToFavoritesButton))
    }
    
    @objc func addToFavoritesButton() {
        dataManager.createFavoriteWordItem(withWord: searchedWord, aPartOfSpeech: searchedResult.partOfSpeech, andDefinition: searchedResult.definition)
    }
    
    private func setUpUI() {
        addScrollView()
        addStackViews()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func addStackViews() {
        contentStackView.addArrangedSubview(definitionView)
        contentStackView.addArrangedSubview(synonymsView)
        contentStackView.addArrangedSubview(antonymsView)
        contentStackView.addArrangedSubview(exampleUsageView)
        
        let emptyView = UIView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.addArrangedSubview(emptyView)
        
        scrollView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            definitionView.widthAnchor.constraint(equalTo: contentStackView.widthAnchor)
        ])
        }
    }
    
    
