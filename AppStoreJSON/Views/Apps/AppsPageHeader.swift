//
//  AppsPageHeader.swift
//  AppStoreJSON
//
//  Created by John Padilla on 8/6/25.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    //MARK: - Properties
    
    let appsHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .blue
        
        addSubview(appsHeaderHorizontalController.view)
        appsHeaderHorizontalController.view.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
