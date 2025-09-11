//
//  AppDetailController.swift
//  AppStoreJSON
//
//  Created by John Padilla on 9/10/25.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Properties
    
    let detilCellId = "detilCellId"
    
    var appId: String! {
        didSet {
            print("Here is my appID:", appId)
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            
            Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, err) in
                print(result?.results.first?.releaseNotes)
            }
        }
    }
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detilCellId)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    //MARK: - Helpers
    
    //MARK: - Actions
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detilCellId, for: indexPath) as! AppDetailCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}
