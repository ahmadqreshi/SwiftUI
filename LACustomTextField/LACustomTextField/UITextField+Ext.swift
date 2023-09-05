//
//  UITextField+Ext.swift
//  LACustomTextField
//
//  Created by Ahmad Qureshi on 27/11/22.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
extension UITextField {
    func setOnTextChangeListener(onTextChanged :@escaping () -> Void){
        self.addAction(UIAction(){ action in
            onTextChanged()
        }, for: .editingChanged)
    }
}
