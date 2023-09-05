//
//  Environment.swift
//  CardList
//
//  Created by Ahmad Qureshi on 19/01/23.
//

import Foundation
public enum PlistKey: String {
    case server_url
    case lottieName
    
    var keyValue: String {
        return self.rawValue.description
    }
}

enum EnvironmentType {
    case development
    case production
    case stage
}

public struct Environment {
    fileprivate var infoDict: [String: Any] {
            if let dict = Bundle.main.infoDictionary {
                return dict
            } else {
                fatalError("Plist file not found")
            }
    }
    
    public func configuration(_ key: PlistKey) -> String {
        return infoDict[key.keyValue] as? String ?? ""
    }
}
