//
//  TodoItemStoreProtoclMock.swift
//  TodoItemstTDDTests
//
//  Created by Simran Preet Singh Narang on 2022-07-21.
//

import Foundation
import Combine
@testable import TodoItemstTDD

class TodoItemStoreProtocolMock: TodoItemStoreProtocol {

    var itemPublisher: CurrentValueSubject<[TodoItem], Never> = .init([])
    
    var checkLastCallArgument: TodoItem?
    
    func check(_ todoItem: TodoItem) {
        checkLastCallArgument = todoItem
    }
    
    func add(_ todoItem: TodoItem) {
        
    }
}
