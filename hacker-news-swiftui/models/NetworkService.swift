//
//  NetworkService.swift
//  hacker-news-swiftui
//
//  Created by Lucien George on 07/02/2023.
//

import Foundation

class NetworkService: ObservableObject {
    // we publish the posts thanks to the ObservableObject and listen to the changes in posts in the ContentView
    @Published var posts = [Post]()

    func fetchData() {
        guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else { return }

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let result = try decoder.decode(Result.self, from: data)
                        DispatchQueue.main.async {
                            self.posts = result.hits
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
}
