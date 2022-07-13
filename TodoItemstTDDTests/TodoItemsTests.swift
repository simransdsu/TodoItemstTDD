//
//  TodoItemsTests.swift
//  TodoItemstTDDTests
//
//  Created by Simran Preet Narang on 2022-06-30.
//

import XCTest
@testable import TodoItemstTDD

class TodoItemsTests: XCTestCase {

    override func setUpWithError() throws {
      
    }

    func test_init_takesTitle() {
        
        let item = TodoItem(title: "Dummy")
        XCTAssertEqual(item.title, "Dummy")
        XCTAssertNil(item.itemDescription, "itemDescription should be nil")
    }
    
    func test_init_takesTitleAnDescription() {
        
        let item = TodoItem(title: "Dummy", itemDescription: "Dummy description")
        XCTAssertEqual(item.title, "Dummy")
        XCTAssertEqual(item.itemDescription, "Dummy description")
    }
    
    func test_init_setsTimestamp() {
        
        let dummyTimeStamp: TimeInterval = 42.0
        let item = TodoItem(title: "Dummy",
                            timestamp: dummyTimeStamp)
        XCTAssertEqual(item.title, "Dummy")
        XCTAssertEqual(item.timestamp, dummyTimeStamp)
    }
    
    
    func test_init_whenGivenLocationsetsLocation() {
        let dummyLocation = Location(name: "Dummy Location")
        let item = TodoItem(title: "Dummy Title",
                            location: dummyLocation)
        
        XCTAssertNotNil(item.location, "Location in item should not be null when set, but is nil")
        XCTAssert(item.location?.name == "Dummy Location", "Location name should be `Dummy Location` but is NOT.")
    }
    
    
    override func tearDownWithError() throws {
      
    }
}
