//
//  Post.swift
//  hacker-news-swiftui
//
//  Created by Lucien George on 07/02/2023.
//

import Foundation

struct Post: Decodable, Identifiable {
    // needed to conform to the identifiable protocol which is needed for the List
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
