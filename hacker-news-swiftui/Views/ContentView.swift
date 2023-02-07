//
//  ContentView.swift
//  hacker-news-swiftui
//
//  Created by Lucien George on 07/02/2023.
//

import SwiftUI

struct ContentView: View {
    // listens to changes in the state of the networkService
    @ObservedObject var networkService = NetworkService()

    var body: some View {
        NavigationView {
            List(networkService.posts) { post in
                NavigationLink {
                    PostView(url: post.url)
                } label: {
                    HStack {
                        VStack {
                            Image(systemName: "triangle.fill")
                                .foregroundColor(.gray)
                            Text(String(post.points))
                        }
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("Hacker News")
        }
        .onAppear {
            networkService.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
