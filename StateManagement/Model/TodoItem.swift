//
//  TodoItem.swift
//  StateManagement
//
//  Created by Naresh Banavath on 15/04/24.
//

import Foundation
struct TodoItem: Hashable, Codable, Identifiable {
    let id: UUID
    var title: String
    var description: String?
    var isDone: Bool = false
}
