//
//  ContentView.swift
//  War-Game
//
//  Created by Ahmad Qureshi on 26/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var playerCard: String = "card2"
    @State private var cpuCard: String = "card4"
    @State private var playerScore: Int = 0
    @State private var cpuScore: Int = 0
    
    let winnigScore: Int = 10
    var body: some View {
        ZStack {
            Image("background").ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button {
                    dealButtonPressed()
                } label: {
                    Image("dealbutton")
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player").foregroundColor(Color.white).font(.subheadline).padding(.bottom,10.0)
                        Text("\(playerScore)").foregroundColor(.white).font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU").foregroundColor(Color.white).font(.subheadline).padding(.bottom,10.0)
                        Text("\(cpuScore)").foregroundColor(.white).font(.largeTitle)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
    private func dealButtonPressed() {
        let number1 = Int.random(in: 2...14)
        let number2 = Int.random(in: 2...14)
        
        playerCard = "card\(number1)"
        cpuCard = "card\(number2)"
        
        if playerScore == winnigScore {
            debugPrint("Player Wins")
            playerScore = 0
            cpuScore = 0
            return
        } else if cpuScore == winnigScore {
            debugPrint("Cpu Wins")
            cpuScore = 0
            playerScore = 0
            return
        }
        if number1 > number2 {
            playerScore += 1
        } else if number2 > number1 {
            cpuScore += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
