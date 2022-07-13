//
//  LocationTests.swift
//  TodoItemstTDDTests
//
//  Created by Simran Preet Narang on 2022-07-12.
//

import XCTest
@testable import TodoItemstTDD
import CoreLocation

class LocationTests: XCTestCase {

    override func setUpWithError() throws {
        
    }
    
    func test_init_setCoordinates() throws {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "Location name", coordinate: coordinate)
        
        let resultCoordinate = try XCTUnwrap(location.coordinate)
        XCTAssertEqual(resultCoordinate.latitude, 1, accuracy: 0.000_001)
        XCTAssertEqual(resultCoordinate.longitude, 2, accuracy: 0.000_001)
    }
    
    
    func test_init_whenGivenLocationNameSetsLocationName() {
        let location = Location(name: "Dummy Location")
        XCTAssert(location.name == "Dummy Location", "Location name should be `Dummy Location` but is NOT.")
    }
    
    
    override func tearDownWithError() throws {
        
    }

}
