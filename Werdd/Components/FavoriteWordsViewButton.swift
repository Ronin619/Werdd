//
//  FavoriteWordsViewButton.swift
//  Werdd
//
//  Created by Eric Tam on 6/8/23.
//

import UIKit

class FavoriteWordsViewButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpUI() {
        tintColor = UIColor(named: "coral")
        
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 40, weight: .heavy, scale: .medium)
        let image = UIImage(systemName: "heart.text.square.fill", withConfiguration: symbolConfiguration)
        setImage(image, for: .normal)
    }
}
