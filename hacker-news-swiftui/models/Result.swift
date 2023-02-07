//
//  Result.swift
//  hacker-news-swiftui
//
//  Created by Lucien George on 07/02/2023.
//

import Foundation

struct Result: Decodable {
    let hits: [Post]
}
