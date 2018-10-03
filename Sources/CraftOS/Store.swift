//
//  Store.swift
//  CraftOS
//
//  Created by Robert Harrison on 04/10/2018.
//

import Foundation

public struct Position {
    public let latitude: Double
    public let longitude: Double
}

public struct Location {
    public let address: Address
    public let position: Position
}

public struct Store: Record {
    public typealias ID = RecordID
    
    let id: ID
    let version: Int
    let created: Date
    let updated: Date
    
    public let name: String
    public let location: Location
    public let photos: Photos
}
