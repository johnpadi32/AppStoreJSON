//
//  AppsController.swift
//  AppStoreJSON
//
//  Created by John Padilla on 6/25/25.
//

import UIKit

class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Properties
    
    let cellId = "id"
    let headerId = "headerId"
    
    //Activity Indicator
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()

    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        //1
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperView()
        
        fetchData()
    }
    
    //MARK: - Helpers
    
    var socialApps = [SocialApp]()
    var groups = [AppGroup]()
    
    fileprivate func fetchData() {
        
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        // help you sync your data fetches together
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        
        Service.shared.fetchTopPay { (appGroup, err) in
            print("Show 1")
            dispatchGroup.leave()
            group1 = appGroup
//            if let group = appGroup {
//                self.groups.append(group)
//            }
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
        }
        
        dispatchGroup.enter()
        
        Service.shared.fetchTopFree {  (appGroup, err) in
            print("Show 2")

            dispatchGroup.leave()
            group2 = appGroup
//            if let group = appGroup {
//                self.groups.append(group)
//            }
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
        }
        
        dispatchGroup.enter()
        Service.shared.fetchAppGroup(urlString: "https://rss.marketingtools.apple.com/api/v2/us/music/most-played/10/albums.json") { (appGroup, err) in
            print("Show 3")

            dispatchGroup.leave()
            group3 = appGroup
//            if let group = appGroup {
//                self.groups.append(group)
//            }
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
        }
        
        dispatchGroup.enter()
        Service.shared.fetchSocialApps { (apps, err) in
            // you should check the err
            dispatchGroup.leave()
            self.socialApps = apps ?? []
        }
        
        
        // Completion
        dispatchGroup.notify(queue: .main) {
            print("completed your dispatch group task...")
            
            self.activityIndicatorView.stopAnimating()
            
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
            }
            if let group = group3 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    //MARK: - Actions
    
    //2
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeader
        header.appsHeaderHorizontalController.socialApps = self.socialApps
        header.appsHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        
        let appGroup = groups[indexPath.item]
        
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.appGroud = appGroup
        cell.horizontalController.collectionView.reloadData()
        
        cell.horizontalController.didSelectHandler =  { [weak self] feedResult in
            let controller = AppDetailController()
            controller.appId = feedResult.id
            controller.navigationItem.title = feedResult.name
            self?.navigationController?.pushViewController(controller, animated: true)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }

}
