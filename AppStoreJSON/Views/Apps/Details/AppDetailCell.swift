//
//  AppDetailCell.swift
//  AppStoreJSON
//
//  Created by John Padilla on 9/10/25.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let appIconImageView = UIImageView(cornerRadius: 16)
    
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    
    let priceButton = UIButton(title: "$4.99")
    
    let whatsNewLabel = UILabel(text: "What's New", font: .boldSystemFont(ofSize: 20))
    
    let releaseNoteLabel = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        appIconImageView.backgroundColor = .red
        appIconImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        appIconImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        priceButton.backgroundColor = .blue
        priceButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        priceButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        priceButton.layer.cornerRadius = 32 / 2
        priceButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        priceButton.setTitleColor(.white, for: .normal)
        
        let priceStackView = UIStackView(arrangedSubviews: [priceButton, UIView()])
        
        let bottomStackView = UIStackView(arrangedSubviews: [nameLabel, priceStackView, UIView()])
        bottomStackView.spacing = 12
        bottomStackView.axis = .vertical
        
        let topStackView = UIStackView(arrangedSubviews: [appIconImageView, bottomStackView], customSpacing: 20)

        let verticalStackView = UIStackView(arrangedSubviews: [topStackView, whatsNewLabel,releaseNoteLabel])
        verticalStackView.spacing = 16
        verticalStackView.axis = .vertical
        
        addSubview(verticalStackView)
        verticalStackView.fillSuperView(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
}

//MARK: - StackView Extension

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}
