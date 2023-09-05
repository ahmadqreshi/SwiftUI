//
//  ContentView.swift
//  gesturesView
//
//  Created by Ahmad Qureshi on 09/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    var body: some View {
        VStack() {
            Rectangle()
                .fill(isSuccess ? .green : .orange)
                .frame(height: 30)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(Color.gray)
                .cornerRadius(10)
                .padding()
            HStack {
                Text("Start")
                    .foregroundColor(.white)
                    .padding(.all,10)
                    .background(.blue)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0,maximumDistance: 50) { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    } perform: {
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }
                Text("Reset")
                    .foregroundColor(.white)
                    .padding(.all,10)
                    .background(.blue)
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isSuccess = false
                            isComplete = false
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
