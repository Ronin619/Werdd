//
//  RefreshButton.swift
//  Werdd
//
//  Created by Eric Tam on 4/19/23.
//

import UIKit

class RefreshButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpUI() {
        tintColor = .white
        
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .heavy, scale: .small)
        let image = UIImage(systemName: "arrow.clockwise.circle", withConfiguration: symbolConfiguration)
        setImage(image, for: .normal)
    }

}
