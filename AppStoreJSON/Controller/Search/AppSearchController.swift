//
//  AppSearchController.swift
//  AppStoreJSON
//
//  Created by John Padilla on 3/20/25.
//

import UIKit
import SDWebImage

class AppSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    //MARK: - Properties
    
    fileprivate let cellId = "id1234"
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchTermLabel: UILabel = {
       let label = UILabel()
        label.text = "Please enter search term above..."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperView(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        
        setupSearchBar()
        
//        fetchITunesApps()
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        // introduce some delay before performin the search
        // throttling the search
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            
            // this will actually fire my search
            
            
            Service.shared.fechApps(searchTerm: searchText) { res, err in
                self.appResults = res?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
        

    }
    
    fileprivate var appResults = [Result]()

    // 2 - Extract this function fetchITunesApps() outside of this controller file
    
    fileprivate func fetchITunesApps() {
        
        Service.shared.fechApps(searchTerm: "twitter") { res, err in
        
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
            
            self.appResults = res?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        // we need to get back our search results somehow
        // use a completion block
        

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        
        cell.appResult = appResults[indexPath.item]
        
        return cell
    }
    
}
