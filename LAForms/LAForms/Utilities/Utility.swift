//
//  Utility.swift
//  LAForms
//
//  Created by Ahmad Qureshi on 07/08/23.
//

import Foundation

func readJsonFile() -> FormsModel? {
    if let bundlePath = Bundle.main.path(forResource: "forms", ofType: "json") {
        do {
            if let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decoder = JSONDecoder()
                return try decoder.decode(FormsModel.self, from: jsonData)
            }
        }
        catch {
            debugPrint("reading error")
        }
        
    }
    return nil
}

