//
//  TodoItemRow.swift
//  StateManagement
//
//  Created by Naresh Banavath on 15/04/24.
//

import SwiftUI

struct TodoItemRow: View {
    @Binding var todoItem : TodoItem
    var body: some View {
        HStack {
            Button(action: {
                todoItem.isDone.toggle()
            }) {
                TodoToggleButton(state: $todoItem.isDone)
            }
            .frame(width: 20)
            VStack(alignment: .leading) {
                Text(todoItem.title)
                    .font(.headline)
                    .strikethrough(todoItem.isDone)
                if let description = todoItem.description {
                    Text(description)
                        .font(.subheadline)
                        .strikethrough(todoItem.isDone)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
    }
}

//
struct TodoItemRow_Previews : PreviewProvider {
    
    static let itemWithoutDescription : TodoItem = .init(id: UUID(uuidString: "eec48f65-4cc8-44cc-9db3-6da65dc12978")!, title: "Buy More Bread 🥖",isDone: true)
    static let itemWithDescription : TodoItem = .init(id: UUID(uuidString:"eec48f65-4cc8-44cc-9db3-6da65dc12978")!, title: "Buy More Bread 🥖", description: "Eating Bread will give you engery for learning", isDone: false)
    
    static var previews: some View {
        Group {
            TodoItemRow(todoItem: .constant(itemWithoutDescription))
                .previewDisplayName("without Description")
            TodoItemRow(todoItem: .constant(itemWithDescription))
                .previewDisplayName("with Decription")
        }
        .previewLayout(.fixed(width: 300, height: 80))

    }
}
