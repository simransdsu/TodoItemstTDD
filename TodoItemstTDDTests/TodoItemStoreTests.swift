//
//  TodoItemStoreTests.swift
//  TodoItemstTDDTests
//
//  Created by Simran Preet Narang on 2022-07-12.
//

import XCTest
@testable import TodoItemstTDD
import Combine

class TodoItemStoreTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    func test_add_shouldPublishChange() {
        let sut = TodoItemStore()
        let publisherExpectation = expectation(description: "Wait for published in \(#file)")
        var receivedItems: [TodoItem] = []
        
        // We are dropping first because CurrentValueSubject publishes the current value right away when
        // subscribed to it. In this case it will publish [] which we do not want.
        let subscription = sut.itemPublisher
            .dropFirst()
            .sink { items in
                receivedItems = items
                publisherExpectation.fulfill()
            }
        let toDoItem = TodoItem(title: "Dummy")
        sut.add(toDoItem)
        
        wait(for: [publisherExpectation], timeout: 1)
        subscription.cancel()
        XCTAssertEqual(receivedItems.first?.title, toDoItem.title)
    }
    
    override func tearDownWithError() throws {
        
    }
}
