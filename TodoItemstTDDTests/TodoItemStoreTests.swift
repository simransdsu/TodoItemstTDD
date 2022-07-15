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

    var sut: TodoItemStore!
    
    override func setUpWithError() throws {
        sut = TodoItemStore(filename: "dummy_store")
    }

    func test_add_shouldPublishChange() throws {
        let todoItem = TodoItem(title: "Dummy")
        let receivedItems: [TodoItem] = try wait(for: sut.itemPublisher, afterChange: {
            sut.add(todoItem)
        })
        XCTAssertEqual(receivedItems, [todoItem])
    }
    
    
    func test_check_shouldPublishChangeInDoneItems() throws {
        let todoItem = TodoItem(title: "Dummy")
        sut.add(todoItem)
        sut.add(TodoItem(title: "Dummy 2"))
        let receivedItem = try wait(for: sut.itemPublisher, afterChange: {
            sut.check(todoItem)
        })
        
        let doneItems = receivedItem.filter { $0.done }
        XCTAssertEqual(doneItems, [todoItem])
    }
    
    func test_init_shouldLoadPreviousTodoItems() {
        
        var sut1: TodoItemStore? = TodoItemStore(filename: "dummy_store")
        let publishedExpectation = expectation(description: "Wait for publisher in \(#file)")
        
        let todoItem = TodoItem(title: "Dummy Title")
        sut1?.add(todoItem)
        sut1 = nil
        
        let sut2 = TodoItemStore(filename: "dummy_store")
        var result: [TodoItem]?
        let token = sut2.itemPublisher
            .sink { values in
                result = values
                publishedExpectation.fulfill()
            }
        wait(for: [publishedExpectation], timeout: 1)
        token.cancel()
        XCTAssertEqual(result, [todoItem])
    }
    
    override func tearDownWithError() throws {
        sut = nil
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("dummy_store").appendingPathExtension("json") {
            try? FileManager.default.removeItem(at: url)
        }
    }
}

extension XCTestCase {
    func wait<T: Publisher>(
        for publisher: T,
        afterChange change: () -> Void,
        file: StaticString = #file,
        line: UInt = #line) throws
    -> T.Output where T.Failure == Never {
        let publisherExpectation = expectation(
            description: "Wait for publisher in \(#file)"
        )
        var result: T.Output?
        let token = publisher
            .dropFirst()
            .sink { value in
                result = value
                publisherExpectation.fulfill()
            }
        change()
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
        let unwrappedResult = try XCTUnwrap(
            result,
            "Publisher did not publish any value",
            file: file,
            line: line
        )
        return unwrappedResult
    }
}
