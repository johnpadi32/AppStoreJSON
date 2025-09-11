//
//  AppGroup.swift
//  AppStoreJSON
//
//  Created by John Padilla on 8/8/25.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
    
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String

}
