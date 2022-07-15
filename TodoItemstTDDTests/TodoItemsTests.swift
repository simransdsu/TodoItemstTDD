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
    
    func test_2TodoItemObjectsWithSameValue_areEquatedAsEquals() {
        let todo1 = TodoItem(title: "Title",
                            itemDescription: "Description",
                            timestamp: 100.0,
                            location: Location(
                                name: "Location",
                                coordinate: Coordinate(latitude: 1, longitude: 2)
                            )
        )
        
        let todo2 = todo1
        
        XCTAssertEqual(todo1, todo2)
    }
    
    func test_2TodoItemObjectsWithDifferebtValue_areEquatedAsUnEquals() {
        let todo1 = TodoItem(title: "Title",
                             itemDescription: "Description",
                             timestamp: 100.0,
                             location: Location(
                                name: "Location",
                                coordinate: Coordinate(latitude: 1, longitude: 2)
                             )
        )
        
        let todo2 = TodoItem(title: "Title",
                             itemDescription: "Description",
                             timestamp: 100.0,
                             location: Location(
                                name: "Location 2",
                                coordinate: Coordinate(latitude: 1, longitude: 2)
                             )
        )
        
        XCTAssertNotEqual(todo1, todo2)
    }
    
    
    override func tearDownWithError() throws {
      
    }
}
