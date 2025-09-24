//
//  Reviews.swift
//  AppStoreJSON
//
//  Created by John Padilla on 9/23/25.
//

import UIKit

struct Reviews: Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
    
    let rating: Label
    
    private enum CodingKeys: String, CodingKey {
        case author, title, content
        case rating = "im:ready"
    }
}

struct Author: Decodable {
    let name: Label
}

struct Label: Decodable {
    let label: String
    
}


