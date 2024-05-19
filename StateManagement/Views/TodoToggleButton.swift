//
//  TodoToggleButton.swift
//  StateManagement
//
//  Created by Naresh Banavath on 06/05/24.
//

import SwiftUI

struct TodoToggleButton: View {
    @Binding var state : Bool
    var body: some View {
        Button {
            withAnimation(.spring(.bouncy, blendDuration: 0.25)) {
                state.toggle()
            }

        } label: {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2.0)
                    .foregroundStyle(.blue)
                if state {
                    Circle()
                        .foregroundStyle(.blue)
                }
            }
                
            
            
        }

    }
}

#Preview {
    TodoToggleButton(state: .constant(true))
        .previewLayout(.fixed(width: 40, height: 40))
}
