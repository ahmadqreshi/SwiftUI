//
//  LottieView.swift
//  CardList
//
//  Created by Ahmad Qureshi on 19/01/23.
//
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let fileName: String
    let animationView = LottieAnimationView()
    let isLooping: Bool
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        //view.backgroundColor = .gray
        animationView.animation = Animation.named(fileName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = isLooping ? .loop : .playOnce
        animationView.play()
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
