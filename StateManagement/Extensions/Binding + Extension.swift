//
//  Binding + Extension.swift
//  StateManagement
//
//  Created by Naresh Banavath on 19/05/24.
//

import SwiftUI
extension Binding {
    
    func withEmpty<Wrapped>(_ defaultValue : Wrapped) -> Binding<Wrapped> where Value == Wrapped? {
        
        Binding<Wrapped>(
            get: { wrappedValue ?? defaultValue },
            set: { wrappedValue = $0  }
        )
        
    }
    
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
