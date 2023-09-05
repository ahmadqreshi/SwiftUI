//
//  ContentView.swift
//  HackerNews
//
//  Created by Ahmad Qureshi on 08/05/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(networkManager.posts) { data in
                NavigationLink(destination: DetailsView(url: data.url)) {
                    HStack{
                        Text("\(data.points)")
                        Divider()
                        Text(data.title)
                    }
                }
            }
            .navigationTitle("Hacker News")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .listRowSeparator(.hidden)
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
