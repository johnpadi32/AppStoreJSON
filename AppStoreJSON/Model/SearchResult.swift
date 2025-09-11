//
//  SearchResult.swift
//  AppStoreJSON
//
//  Created by John Padilla on 6/10/25.
//

import Foundation


struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String // app icon
    let formattedPrice: String
    let description: String
    let releaseNotes: String
}
