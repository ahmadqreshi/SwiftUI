//
//  UIResponder+Ext.swift
//  LACustomTextField
//
//  Created by Ahmad Qureshi on 27/11/22.
//

import Foundation
import SwiftUI

extension UIResponder {
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }
    
    private static weak var _currentFirstResponder: UIResponder?
    
    @objc private func findFirstResponder(_ sender: Any) {
        UIResponder._currentFirstResponder = self
    }
    
    var globalView: UIView? {
        return self as? UIView
    }
}
