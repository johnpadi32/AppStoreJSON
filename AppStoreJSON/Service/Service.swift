//
//  Service.swift
//  AppStoreJSON
//
//  Created by John Padilla on 6/12/25.
//

import UIKit

class Service {
    
    static let shared = Service() // singleton
    
    func fechApps(searchTerm:String, completion: @escaping (SearchResult?, Error?) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopPay(completion: @escaping (AppGroup?, Error?) ->()) {
        let urlString = "https://rss.marketingtools.apple.com/api/v2/us/apps/top-paid/10/apps.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchTopFree(completion: @escaping (AppGroup?, Error?) ->()) {
        fetchAppGroup(urlString: "https://rss.marketingtools.apple.com/api/v2/us/apps/top-free/50/apps.json", completion: completion)
        
    }
    // helper
    
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
      fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // declare my generic json function here
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping(T?, Error?) -> ()) {
        
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                
                // success
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
        }
        .resume()
    }
}
