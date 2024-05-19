//
//  TodoItemsListViewModel.swift
//  StateManagement
//
//  Created by Naresh Banavath on 19/05/24.
//

import Foundation
class TodoItemsListViewModel : ObservableObject {
    @Published var todoItems : [TodoItem] = []
    
    func loadItems(){
            todoItems =  .loadFromJson("todoItems") ?? []
    }
    
    func reorder() {
        
            todoItems.sort(by: {  !$0.isDone && $1.isDone  })
       
    }
    
    func onDelete(_ index : IndexSet) {
        todoItems.remove(atOffsets: index)
    }
    func onMove(from : IndexSet, to : Int) {
        todoItems.move(fromOffsets: from, toOffset: to)
    }
}

