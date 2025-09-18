//
//  ReviewCell.swift
//  AppStoreJSON
//
//  Created by John Padilla on 9/17/25.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let reviewController = ReviewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        addSubview(reviewController.view)
        reviewController.view.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
