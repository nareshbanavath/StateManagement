//
//  TodoItemDetailView.swift
//  StateManagement
//
//  Created by Naresh Banavath on 20/05/24.
//

import SwiftUI

struct TodoItemDetailView: View {
    @Binding var todoItem : TodoItem
    var body: some View {
        Form{
            TextField("Title", text: $todoItem.title)
                .font(.headline)
            TextField("Description", text: $todoItem.description.withEmpty(""))
                .font(.subheadline)
        }
        .navigationTitle("ToDo")
    }
}

#Preview {
    TodoItemDetailView(todoItem: .constant(TodoItem(id: UUID(uuidString: "eec48f65-4cc8-44cc-9db3-6da65dc12978")!, title: "Buy some food to me")))
}

