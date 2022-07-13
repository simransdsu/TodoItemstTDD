//
//  TodoItem.swift
//  TodoItemstTDD
//
//  Created by Simran Preet Narang on 2022-07-08.
//

import Foundation

struct TodoItem: Equatable {
    let title: String
    let itemDescription: String?
    let timestamp: TimeInterval?
    let location: Location?
    
    init(title: String, itemDescription: String? = nil, timestamp: TimeInterval? = Date().timeIntervalSince1970, location: Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
    
    static func == (lhs: TodoItem, rhs: TodoItem) -> Bool {
        return lhs.title == rhs.title
        && lhs.itemDescription == rhs.itemDescription
        && lhs.timestamp == rhs.timestamp
        && lhs.location?.coordinate?.latitude == rhs.location?.coordinate?.latitude
        && lhs.location?.name == rhs.location?.name
        && lhs.location?.coordinate?.longitude == rhs.location?.coordinate?.longitude
    }
}
