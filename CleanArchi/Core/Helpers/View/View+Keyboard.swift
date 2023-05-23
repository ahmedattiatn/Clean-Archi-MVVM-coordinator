//
//  View+Keyboard.swift
//
//  Created by Ahmed Atia on 05/05/2023.
//

import SwiftUI
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
