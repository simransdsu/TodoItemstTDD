//
//  Location.swift
//  TodoItemstTDD
//
//  Created by Simran Preet Narang on 2022-07-12.
//

import Foundation

struct Location: Codable {
    let name: String
    let coordinate: Coordinate?
    
    init(name: String, coordinate: Coordinate? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}
