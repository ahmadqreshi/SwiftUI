//
//  ContentView.swift
//  KingFisherDemo
//
//  Created by Ahmad Qureshi on 07/11/22.
//

import SwiftUI
import Kingfisher
import SDWebImageSwiftUI

class ViewModel {
    func url() -> URL? {
        guard let url = URL(string: "https://assets.learnapp.com/img/ff8ba352-62a4-4ae7-9f3b-774cf7b02c50.webp") else { return nil}
        return url
    }
}

struct ContentView: View {
    let vm = ViewModel()
    //    var body: some View {
    //        VStack {
    //            KFImage.url(vm.url())
    //                .resizable()
    //            WebImage(url: URL(string: "https://assets.learnapp.com/img/ff8ba352-62a4-4ae7-9f3b-774cf7b02c50.webp"))
    //                // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
    //                .onSuccess { image, data, cacheType in
    //                    // Success
    //                    // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
    //                }
    //                .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
    //                .placeholder(Image(systemName: "photo")) // Placeholder Image
    //                // Supports ViewBuilder as well
    ////                .placeholder {
    ////                    Rectangle().foregroundColor(.gray)
    ////                }
    //                .indicator(.activity) // Activity Indicator
    //                .transition(.fade(duration: 0.5)) // Fade Transition with duration
    //                .scaledToFit()
    //                .frame(width: 300, height: 300, alignment: .center)
    //            Spacer()
    //        }
    //        .padding()
    //    }
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            fetchImage(url: "https://images.unsplash.com/photo-1605701250441-2bfa95839417?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072&q=80")
                .cutomFrame(width: 200, height: 200)
                
        }
    }
}

struct fetchImage: View {
    var url: String
    @State private var isLoading: Bool = true
    var body: some View {
        ZStack {
            WebImage(url: URL(string: url))
                .onSuccess { _, _, _ in
                    isLoading = false
                }
                .resizable()
                .scaledToFill()
            if isLoading {
                ProgressView()
                    .accentColor(.red)
                    .progressViewStyle(.circular)
            }
        }
    }
    
    
    @inlinable func cutomFrame(width: CGFloat? = nil , height: CGFloat? = nil) -> some View  {
        return self.frame(width: width, height: height).clipped()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
