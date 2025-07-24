//
//  Service.swift
//  AppStoreJSON
//
//  Created by John Padilla on 6/12/25.
//

import UIKit

class Service {
    
    static let shared = Service() // singleton
    
    func fechApps(searchTerm:String, completion: @escaping ([Result], Error?) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        guard let url = URL(string: urlString) else {return}
        
        //fetch data from internet
        URLSession.shared.dataTask(with: url) { data, resp, err in
            
            if let err = err {
                print("Failed to fetch apps:", err)
                completion([], nil)
                return
            }
            
            // Success
            guard let data = data else { return }
            
            do {
                let searchResult = try
                JSONDecoder().decode(SearchResult.self, from: data)
                
                completion(searchResult.results, nil)
                
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion([], jsonErr)

            }
            
        }.resume()  // fires off the request
    }
}
