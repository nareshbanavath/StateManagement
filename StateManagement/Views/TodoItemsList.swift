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
        
        NavigationStack {
            List {
                ForEach($viewModel.todoItems) { $item in
                    
                    NavigationLink(value: item) {
                        TodoItemRow(todoItem: $item.onNewValue {
                            viewModel.reorder()
                        })
                    }
                    
//                    NavigationLink(destination: TodoItemDetailView(todoItem: item)) {
//                        TodoItemRow(todoItem: item.onNewValue {
//                            viewModel.reorder()
//                        })
//                    }

                }
                .onDelete(perform: viewModel.onDelete(_:))
                .onMove(perform: { indices, newOffset in
                    viewModel.onMove(from: indices, to: newOffset)
                })
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Todo Items")
            .navigationDestination(for: TodoItem.self, destination: { item in
                let todoItemBinding = Binding(
                    get: {
                        viewModel.todoItems.first(where: {$0.id == item.id})!
                    },
                    set: { newItem in
                        let index = viewModel.todoItems.firstIndex(where: {$0.id == item.id})!
                        viewModel.todoItems[index] = newItem
                    }
                
                )
                TodoItemDetailView(todoItem: todoItemBinding)
            })
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
