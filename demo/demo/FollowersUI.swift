//
//  FollowersUI.swift
//  demo
//
//  Created by Ahmad Qureshi on 03/11/22.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let isVerified: Bool
    let followersCount: Int
}

struct FollowersUI: View {
    var users: [UserModel] = [
        UserModel(name: "Raj", isVerified: true, followersCount: 501),
        UserModel(name: "Rohan", isVerified: false, followersCount: 288),
        UserModel(name: "RajMohan", isVerified: true, followersCount: 50),
        UserModel(name: "Ritik", isVerified: false, followersCount: 28),
        UserModel(name: "Salman", isVerified: true, followersCount: 501),
        UserModel(name: "Shahrukh", isVerified: false, followersCount: 288),
        UserModel(name: "aishwarya", isVerified: true, followersCount: 50),
        UserModel(name: "disha", isVerified: false, followersCount: 28),
        UserModel(name: "Raj", isVerified: true, followersCount: 501),
        UserModel(name: "Rohan", isVerified: false, followersCount: 288),
        UserModel(name: "RajMohan", isVerified: true, followersCount: 50),
        UserModel(name: "Ritik", isVerified: false, followersCount: 28),
        UserModel(name: "Salman", isVerified: true, followersCount: 501),
        UserModel(name: "Shahrukh", isVerified: false, followersCount: 288),
        UserModel(name: "aishwarya", isVerified: true, followersCount: 50),
        UserModel(name: "disha", isVerified: false, followersCount: 28),
    ]
    var body: some View {
        NavigationView {
            ZStack {
                List(users) { user in
                    UserCellView(name: user.name, isVerified: user.isVerified, followersCount: user.followersCount)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            debugPrint("hello")
                        }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Users")
        }
        
    }
}

struct FollowersUI_Previews: PreviewProvider {
    static var previews: some View {
        FollowersUI()
    }
}

struct UserCellView: View {
    let name: String
    let isVerified: Bool
    let followersCount: Int
    var body: some View {
        HStack(alignment : .top) {
            Circle()
                .fill(.blue)
                .frame(width: 35,height: 35)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                HStack(alignment: .center) {
                    Text("@\(name)")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    if isVerified {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.blue)
                    }
                }
            }
            Spacer()
            Text("Followers: \(followersCount)")
                .font(.headline)
            
        }
        .padding(.horizontal,20)
    }
}
