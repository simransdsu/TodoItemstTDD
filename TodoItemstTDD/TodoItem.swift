//
//  TodoItem.swift
//  TodoItemstTDD
//
//  Created by Simran Preet Narang on 2022-07-08.
//

import Foundation

struct TodoItem: Equatable {
    let id: UUID
    let title: String
    let itemDescription: String?
    let timestamp: TimeInterval?
    let location: Location?
    var done = false
    
    init(title: String,
         itemDescription: String? = nil,
         timestamp: TimeInterval? = Date().timeIntervalSince1970,
         location: Location? = nil) {
        self.id = UUID()
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
    
    static func == (lhs: TodoItem, rhs: TodoItem) -> Bool {
        return lhs.id == rhs.id
    }
}
