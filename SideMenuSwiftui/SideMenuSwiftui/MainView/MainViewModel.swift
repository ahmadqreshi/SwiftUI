//
//  MainViewModel.swift
//  SideMenuSwiftui
//
//  Created by Ahmad Qureshi on 29/12/22.
//

import SwiftUI
class MainViewModel: ObservableObject {
    @Binding var showMenu: Bool
    init(showMenu: Binding<Bool>) {
        self._showMenu = showMenu
    }
}
