//
//  TodoItemsListViewControllerTests.swift
//  TodoItemstTDDTests
//
//  Created by Simran Preet Singh Narang on 2022-07-19.
//

import XCTest
@testable import TodoItemstTDD

class TodoItemsListViewControllerTests: XCTestCase {

    var sut: TodoItemsListViewController!
    var todoItemsStoreMock: TodoItemStoreProtocolMock!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = try XCTUnwrap(storyboard.instantiateInitialViewController() as? TodoItemsListViewController)
        todoItemsStoreMock = TodoItemStoreProtocolMock()
        sut.todoItemStore = todoItemsStoreMock
        sut.loadViewIfNeeded()
    }
    
    func test_shouldBeSetup() {
        XCTAssertNotNil(sut)
    }
    
    func test_shouldHaveTableView() {
        XCTAssertTrue(sut.tableView.isDescendant(of: sut.view))
    }
    
    func test_numberOfRows_whenOneItemIsSent_shouldReturnOne() {
        
        todoItemsStoreMock.itemPublisher.send([TodoItem(title: "dummy 1")])
        
        let result = sut.tableView.numberOfRows(inSection: 0)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_numberOfRows_whenTwoItem2AreSent_shouldReturnTwo() {
        
        todoItemsStoreMock.itemPublisher.send([
            TodoItem(title: "dummy 1"),
            TodoItem(title: "dummy 2")
        ])
        
        let result = sut.tableView.numberOfRows(inSection: 0)
        
        XCTAssertEqual(result, 2)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
}
