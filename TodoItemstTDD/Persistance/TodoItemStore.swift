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
    
    private let filename: String
    
    init(filename: String = "todoItems") {
        self.filename = filename
        loadItems()
    }
    
    func add(_ todoItem: TodoItem) {
        items.append(todoItem)
        saveItems()
    }
    
    func check(_ todoItem: TodoItem) {
        var mutableItem = todoItem
        mutableItem.done = true
        if let index = items.firstIndex(of: mutableItem) {
            items[index] = mutableItem
            saveItems()
        }
        
    }
    
    private func saveItems() {
        let url = FileManager.default.documentsURL(name: filename)
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: url)
        } catch  {
            print("❌ in \(#function) \(error.localizedDescription) \n", error)
        }
        
    }

    private func loadItems() {
        let url = FileManager.default.documentsURL(name: filename)
        do {
            let data = try Data(contentsOf: url)
            items = try JSONDecoder().decode([TodoItem].self, from: data)
        } catch  {
            print("❌ in \(#function) \(error.localizedDescription) \n", error)
        }
    }
}
