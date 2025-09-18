//
//  ReviewCell.swift
//  AppStoreJSON
//
//  Created by John Padilla on 9/17/25.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 16))
    
    let authorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
    
    let starLabel = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    
    let bodyLabel = UILabel(text: "Review body\nReview body\nReview body\n", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray5
        
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let topStackView = UIStackView(arrangedSubviews: [titleLabel, UIView(), authorLabel])
        let stackView = UIStackView(arrangedSubviews: [topStackView, starLabel, bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
