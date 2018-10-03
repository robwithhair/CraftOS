//
//  Contact.swift
//  Async
//
//  Created by Robert Harrison on 03/10/2018.
//

import Foundation
import PhoneNumberKit
import CoreLocation

public typealias Names = [String]

public struct Contact {    
    public let title: String
    public let names: Names
    public let address: Address
    public let phone: PhoneNumber
}

