//
//  AppsGroupCell.swift
//  AppStoreJSON
//
//  Created by John Padilla on 7/22/25.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 30))
    
//    let titleLabel: UILabel = {
//       let label = UILabel()
//        label.text = "App Section"
//        label.font = .boldSystemFont(ofSize: 30)
//        return label
//    }()
    
    let horizontalController = AppsHorizontalController()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 0, paddingLeft: 16)
        
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .blue
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
