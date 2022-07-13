//
//  Location.swift
//  TodoItemstTDD
//
//  Created by Simran Preet Narang on 2022-07-12.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}
