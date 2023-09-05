//
//  ContentView.swift
//  CardList
//
//  Created by Ahmad Qureshi on 26/10/22.
//

import SwiftUI

struct ContentView: View {
    var cardListViewModel = CardListViewModel()
    var body: some View {
        NavigationView {
            List(cardListViewModel.cardLists,id: \.id) { developers in
                CardView(name: developers.name, description: developers.description)
            }
            //.navigationTitle("Developers PortFolio")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .listRowSeparator(.hidden)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
