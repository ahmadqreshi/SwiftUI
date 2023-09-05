//
//  ContentView.swift
//  ListFunctionalities
//
//  Created by Ahmad Qureshi on 28/10/22.
//

import SwiftUI

struct DevelopersListView: View {
    @State private var developers: [String] = [
        "Ahmad Qureshi", "Mohd Wasiq", "Karan Jaiswal", "Ayush Mishra", "Nitish Kumar"
    ]
    @State var addDevPressed: Bool = false
    @State var newUser: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    Section {
                        ForEach(developers, id: \.self) { dev in
                            Text(dev)
                        }
                        .onDelete(perform: deleteRow)
                        .onMove(perform: moveRow)
                    } header: {
                        Text("Famous in Town")
                    }
                        //.listRowSeparator(.hidden)
                }
                if addDevPressed {
                    PopUpView(newUser: $newUser, addDevPressed: $addDevPressed, developers: $developers)
                }
            }
            .navigationTitle("Developers")
            //.listStyle(.plain)
            //.navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: EditButton(),
                trailing: addBtn)
        }
    }
    var addBtn: some View {
        Button("Add") {
            withAnimation(Animation.easeIn) {
                addDevPressed.toggle()
            }
        }
    }
    private func deleteRow(indexSet: IndexSet) {
        self.developers.remove(atOffsets: indexSet)
    }
    private func moveRow(from: IndexSet,to: Int ) {
        self.developers.move(fromOffsets: from, toOffset: to)
    }
}
struct PopUpView: View  {
    @Binding var newUser: String
    @Binding var addDevPressed: Bool
    @Binding var developers: [String]
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .frame(height: 200)
            .padding(.horizontal,20)
            .shadow(color: .green, radius: 10)
            .overlay(alignment: .topLeading) {
                VStack {
                    TextField("Enter User Name", text: $newUser)
                        .padding(.all,40)
                    Spacer()
                    Button {
                        self.developers.append(newUser)
                        withAnimation {
                            addDevPressed = false
                        }
                    } label: {
                        Text("Done")
                            .foregroundColor(.white)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.blue)
                            }
                            .padding(.bottom,20)
                    }

                }
            }
            .transition(.move(edge: .top))
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DevelopersListView()
    }
}
