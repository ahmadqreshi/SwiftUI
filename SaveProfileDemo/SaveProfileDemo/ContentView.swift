//
//  ContentView.swift
//  SaveProfileDemo
//
//  Created by Ahmad Qureshi on 29/11/22.
//

import SwiftUI
import LAResources


struct ContentView: View {
    @State private var showActionSheet: Bool = false
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    @State private var sheetCondition: SheetCondition = .gallery {
        didSet {
            isShowPhotoLibrary.toggle()
        }
    }
    enum SheetCondition {
        case gallery
        case camera
    }
    var body: some View {
        ZStack {
            backgroundView
            VStack(spacing: 10) {
                ZStack {
                    Circle()
                        .fill(Color("bgColor"))
                        .overlay {
                            Image("image")
                                .resizable()
                                .frame(width: 40,height: 30)
                        }
                    Image(uiImage: self.image)
                        .resizable()
                        .frame(width: 100,height: 100)
                        .cornerRadius(50)
                }.frame(width: 100,height: 100)
                Button {
                    showActionSheet = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.white,lineWidth: 1)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.clear)
                            )
                            .frame(width: 90 ,height:30)
                        Text("Add Photo")
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }
        }
        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
        .sheet(isPresented: $isShowPhotoLibrary) {
            switch sheetCondition {
            case .gallery:
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            case .camera:
                ImagePicker(sourceType: .camera, selectedImage: self.$image)
            }
        }
    }
    private var backgroundView: some View {
        ColorAsset.lotusRed.set
    }
    private func getActionSheet() -> ActionSheet {
        let button1: ActionSheet.Button = .default(Text("Open Camera")) {
            sheetCondition = .camera
        }
        let button2: ActionSheet.Button = .default(Text("Open Gallery")) {
            sheetCondition = .gallery
        }
        let button3: ActionSheet.Button = .cancel()
        return ActionSheet(
            title: Text("Select image"),
            message: Text("choose any option"),
            buttons: [button1,button2,button3]
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
