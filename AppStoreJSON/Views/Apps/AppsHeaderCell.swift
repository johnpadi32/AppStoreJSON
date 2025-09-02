//
//  AppsHeaderCell.swift
//  AppStoreJSON
//
//  Created by John Padilla on 8/7/25.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let companyLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 12))
    
    let titleLabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 24))

    let imageView = UIImageView(cornerRadius: 8)
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        companyLabel.textColor = .blue
        titleLabel.numberOfLines = 2
        
        let stackView = UIStackView(arrangedSubviews: [companyLabel, titleLabel, imageView])
        stackView.axis = .vertical
        stackView.spacing = 12
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
