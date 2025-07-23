//
//  AppsController.swift
//  AppStoreJSON
//
//  Created by John Padilla on 6/25/25.
//

import UIKit

class AppsController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .yellow
    }
    
    //MARK: - Helpers
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
