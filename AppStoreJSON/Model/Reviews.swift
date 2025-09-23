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
}

struct Author: Decodable {
    let name: Label
}

struct Label: Decodable {
    let label: String
    
}


