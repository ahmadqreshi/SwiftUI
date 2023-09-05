//
//  ContentView.swift
//  CodingWorkshop
//
//  Created by Ahmad Qureshi on 04/11/22.
//

import SwiftUI

struct KeyValue {
    let key: String
    let value: Any
}
enum Keys: String {
    case data1
}
class CacheSystem {
    private var memory: [KeyValue] = []
    func save(data: KeyValue, duration: Double) {
        memory.append(data)
        let timer = Timer(timeInterval: duration, repeats: true) { _ in
            self.delete(key: data.key)
        }
    }
    func fetch(key : String) -> KeyValue {
        guard let index = memory.firstIndex(where: {$0.key == key}) else {fatalError("Key is not found")}
        return memory[index]
    }
    func delete(key : String) {
        guard let index = memory.firstIndex(where: {$0.key == key}) else { debugPrint("Item not found"); return}
        memory.remove(at: index)
    }
    func sizeOfCache() -> Int {
        return memory.count
    }
    func clearCache() {
        memory.removeAll()
    }
}



struct ContentView: View {
    let cacheSystem = CacheSystem()
    var body: some View {
        VStack {
            Button {
                setUp()
            } label: {
                Text("Press me")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.all,10)
                    .background(.blue)
                    .cornerRadius(10)
            }
        }.onAppear {
        }
        .padding()
    }
    private func setUp() {
        let data = KeyValue(key: Keys.data1.rawValue, value: 20)
        cacheSystem.save(data: data, duration: 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
