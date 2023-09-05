//
//  ContentView.swift
//  TabBar&PageTabBar
//
//  Created by Ahmad Qureshi on 28/10/22.
//

import SwiftUI

struct ContentView: View {
    init() {
        //UITabBar.appearance().barTintColor = UIColor.red
        //UITabBar.appearance().backgroundColor = .blue
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(named: "Secondary")
    }
    @State var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                        .foregroundColor(.gray)
                    Text("Home")
                        .bold()
                    
                }
                .tag(0)
            BrowseView()
                .tabItem {
                    Image(systemName: "globe")
                        .foregroundColor(.gray)
                    Text("Home")
                        .bold()
                    
                }
                .tag(1)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                        .foregroundColor(.gray)
                    Text("Home")
                        .bold()
                    
                }
                .tag(2)
        }
        .tabViewStyle(.automatic)
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .ignoresSafeArea()
            VStack {
                Rectangle()
                    .fill(.clear)
                    .frame(height: 50)
                    .overlay {
                        Text("Tab View")
                            .bold()
                            .foregroundColor(.white)
                    }
                ScrollView {
                    ListView(tag: 0)
                    ListView(tag: 1)
                    ListView(tag: 2)
                    ListView(tag: 3)
                    ListView(tag: 4)
                    ListView(tag: 5)
                }
            }
        }
    }
}
struct BrowseView: View {
    var body: some View {
        ZStack {
            Color(.systemCyan)
                .ignoresSafeArea()
        }
    }
}
struct ProfileView: View {
    var body: some View {
        ZStack {
            Color(.systemMint)
                .ignoresSafeArea()
        }
    }
}

struct ListView: View {
    var tag: Int
    var body: some View {
        VStack {
            TabView {
                RoundedRectangle(cornerRadius: 20)
                    .padding(.horizontal,20)
                RoundedRectangle(cornerRadius: 20)
                    .padding(.horizontal,20)
                
            }
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle())
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 50)
                .overlay {
                    HStack {
                        Text("Today's Special")
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 50,height: 50)
                            .onTapGesture {
                                switch tag {
                                case 0:
                                    debugPrint(tag)
                                case 1:
                                    debugPrint(tag)
                                default:
                                    debugPrint(tag)
                                }
                            }
                    }
                    .padding(.horizontal,20)
                }
            Spacer()
        }
    }
}
