//
//  TodoItemStore.swift
//  TodoItemstTDD
//
//  Created by Simran Preet Narang on 2022-07-13.
//

import Foundation
import Combine

class TodoItemStore {
    
    var itemPublisher = CurrentValueSubject<[TodoItem], Never>([])
    private var items: [TodoItem] = [] {
        didSet {
            itemPublisher.send(items)
        }
    }
    
    func add(_ todoItem: TodoItem) {
        items.append(todoItem)
    }
}
