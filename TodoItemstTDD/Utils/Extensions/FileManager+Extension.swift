//
//  FileManager+Extension.swift
//  TodoItemstTDD
//
//  Created by Simran Preet Narang on 2022-07-15.
//

import Foundation

extension FileManager {
    
    func documentsURL(name: String) -> URL {
        guard let documentsUrl = urls(for: .documentDirectory, in: .userDomainMask)
            .first else {
            fatalError()
        }
        
        return documentsUrl.appendingPathComponent(name)
    }
}
