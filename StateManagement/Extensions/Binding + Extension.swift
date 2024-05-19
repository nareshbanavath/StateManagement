//
//  Binding + Extension.swift
//  StateManagement
//
//  Created by Naresh Banavath on 19/05/24.
//

import SwiftUI
extension Binding {
    
    func onNewValue(_ handle : @escaping () -> Void) -> Self {
        Binding(
            get: { wrappedValue },
            set: {
                wrappedValue = $0
                handle()
            }
        )
    }
}
