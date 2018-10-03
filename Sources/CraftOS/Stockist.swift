//
//  Stockist.swift
//  Async
//
//  Created by Robert Harrison on 03/10/2018.
//

import Foundation

public struct Stockist: Record {
    public typealias ID = RecordID
    
    public let id: ID
    public let version: Int
    public let created: Date
    public let updated: Date
    
    public let name: String
    public let description: String
    public let biography: String
    public let billingContact: Contact
    public let profilePhoto: URL
    public let banner: URL
}
