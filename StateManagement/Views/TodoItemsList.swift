//
//  ContentView.swift
//  StateManagement
//
//  Created by Naresh Banavath on 15/04/24.
//

import SwiftUI

struct TodoItemsList: View {
    @StateObject var viewModel = TodoItemsListViewModel()
    var body: some View {
        
        NavigationView {
            List {
                ForEach($viewModel.todoItems) { item in
                    TodoItemRow(todoItem: item.onNewValue {
                        viewModel.reorder()
                    })
                }
                .onDelete(perform: viewModel.onDelete(_:))
                .onMove(perform: { indices, newOffset in
                    viewModel.onMove(from: indices, to: newOffset)
                })
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Todo Items")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            })
            .onAppear{
                viewModel.loadItems()
            }
        }
    }
}

#Preview {
    TodoItemsList()
}
