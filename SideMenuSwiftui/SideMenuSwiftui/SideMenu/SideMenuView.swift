//
//  SideMenuView.swift
//  SideMenuSwiftui
//
//  Created by Ahmad Qureshi on 29/12/22.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var showMenu: Bool
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            HStack {
                cancelButton
                Spacer()
            }
            .padding(.top,40)
            HStack(spacing: 0) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 50,height: 50)
                    .padding(.trailing,16)
                VStack(alignment: .leading,spacing: 5) {
                    Text("Ahmad Qureshi")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("annual subscription")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                settingsButton
            }
            .padding(.vertical,30)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading,spacing: 20) {
                    NavigationLink(destination: Text("home")) {
                        listItem(icon: "house", title: "Home")
                    }
                    NavigationLink(destination: Text("All Courses")) {
                        listItem(icon: "book.fill", title: "All Courses")
                    }
                }
            }
        }
        .padding(.horizontal,20)
        .frame(maxHeight: .infinity)
        .background(
            Color.black
                .edgesIgnoringSafeArea(.all)
        )
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    private var cancelButton: some View {
        Button {
            showMenu.toggle()
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(.white)
        }
        
    }
    private var settingsButton: some View {
        Button {
            debugPrint("setting button")
        } label: {
            Image(systemName: "gear")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 30,height: 30)
        }
    }
    @ViewBuilder
    private func listItem(icon: String, title: String) -> some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .foregroundColor(isHomeCell(icon: icon, title: title) ? .blue : .gray)
                .frame(width: 25, height: 25)
            Text(title)
                .foregroundColor(isHomeCell(icon: icon, title: title) ? .white : .gray)
                .font(.headline)
                .padding(.leading,10)
            Spacer()
        }
    }
    private var divider: some View {
        Rectangle()
            .foregroundColor(.gray)
            .opacity(0.3)
            .frame(maxWidth: .infinity)
            .frame(height: 1)
    }
    
    
    private func isHomeCell(icon: String, title: String) -> Bool {
        return  icon == "house" && title == "Home" ? true : false
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(showMenu: .constant(false))
    }
}
