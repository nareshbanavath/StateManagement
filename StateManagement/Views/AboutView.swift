//
//  AboutView.swift
//  StateManagement
//
//  Created by Naresh Banavath on 21/05/24.
//

import SwiftUI

struct AboutView: View {
    @State var isMoreInfoPresented : Bool = false
    var body: some View {
        ZStack {
            Color.red
            
            VStack{
                Text("This is About us view in swiftUI learning process 🥂")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                Button("More Info") {
                    isMoreInfoPresented = true
                }
                .fontWeight(.semibold)
            }
        }
        .sheet(isPresented: $isMoreInfoPresented, content: {
            MoreInfo()
                .presentationDetents([.medium, .fraction(0.25)])
                
        })
    }
}

#Preview {
    AboutView()
}

struct MoreInfo : View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Button("Dismiss") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
