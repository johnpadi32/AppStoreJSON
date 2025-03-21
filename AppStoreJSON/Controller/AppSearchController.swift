//
//  AppSearchController.swift
//  AppStoreJSON
//
//  Created by John Padilla on 3/20/25.
//

import UIKit

class AppSearchController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .yellow
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
