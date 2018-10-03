//
//  Product.swift
//  Async
//
//  Created by Robert Harrison on 03/10/2018.
//

import Foundation

public struct Product: Record {
    public typealias ID = RecordID
    
    public let id: ID
    public let version: Int
    public let created: Date
    public let updated: Date
    
    public let name: String
    public let description: String
    public let variations: Variations
    
    public typealias Variations = [Variation]
    
    public struct Variation {
        public let name: String
        public let photos: Photos
    }
}

