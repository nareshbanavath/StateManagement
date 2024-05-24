//
//  HomeView.swift
//  StateManagement
//
//  Created by Naresh Banavath on 22/05/24.
//

import Foundation
import SwiftUI
struct HomeView : View {
    enum Tab : Hashable {
        case todos
        case about
    }
    
    @State var selectedTab : Tab = .todos
    
    var body: some View {
        TabView {
            TodoItemsList()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Todo")
                }
                .tag(Tab.todos)
            AboutView()
                .tabItem {
                    Image(systemName: "questionmark.circle.fill")
                    Text("About us")
                }
                .tag(Tab.about)
        }
        .tint(.purple)
    }
}
