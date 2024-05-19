//
//  ContentView.swift
//  StateManagement
//
//  Created by Naresh Banavath on 15/04/24.
//

import SwiftUI

struct TodoItemsList: View {
    @State var todoItems : [TodoItem] = (.loadFromJson("todoItems") ?? [])
    {
        didSet {
            let finished = todoItems.filter{ $0.isDone == true}
            let d = todoItems.drop(while: {$0.isDone == true})
            todoItems = d + finished
        }
    }
    var body: some View {
        List($todoItems) { item in
            TodoItemRow(todoItem: item)
        }
        .padding()
    }
}

#Preview {
    TodoItemsList()
}
