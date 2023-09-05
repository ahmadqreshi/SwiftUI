//
//  ContentView.swift
//  ActionSheet
//
//  Created by Ahmad Qureshi on 28/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var showActionSheet: Bool = false
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.white)
                    .frame(height: 40)
                    .overlay(alignment: .center) {
                        HStack {
                            Button {
                                debugPrint("Side Menu Button pressed")
                            } label: {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.primary)
                            }
                            .padding(.leading,20)
                            Spacer()
                        }
                    }
                ScrollView {
                    ForEach(0..<11) {_ in
                        PostsView(showActionSheet: $showActionSheet)
                    }
                }
            }
            .padding(.top,20)
        }
        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
    }
    private func getActionSheet() -> ActionSheet {
        let button1: ActionSheet.Button = .default(Text("Share"))
        let button2: ActionSheet.Button = .destructive(Text("Report"))
        let button3: ActionSheet.Button = .cancel()
        
        return ActionSheet(
            title: Text("Share"),
            message: Text("What you want to do"),
            buttons: [button1,button2,button3]
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PostsView: View {
    @Binding var showActionSheet: Bool
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Circle()
                    .frame(width: 30,height: 30)
                Text("@username")
                Spacer()
                Button {
                    showActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.primary)
                }
                
            }.padding(.horizontal,20)
            Rectangle().frame(height: 300)
            Spacer()
        }
    }
}
