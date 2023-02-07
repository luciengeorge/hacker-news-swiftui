//
//  PostView.swift
//  hacker-news-swiftui
//
//  Created by Lucien George on 07/02/2023.
//

import SwiftUI

struct PostView: View {
    let url: String?
    var body: some View {
        WebView(url: url)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(url: "https://www.google.com")
    }
}
