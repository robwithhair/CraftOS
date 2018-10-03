//
//  Record.swift
//  Async
//
//  Created by Robert Harrison on 03/10/2018.
//

import Foundation

public typealias RecordID = String

protocol Record {
    var id: RecordID { get }
    var version: Int { get }
    var created: Date { get }
    var updated: Date { get }
}
