//
//  Photo.swift
//  CraftOS
//
//  Created by Robert Harrison on 04/10/2018.
//

import Foundation

public typealias Photos = [Photo]

public struct Photo {
    public let origionalURL: URL
    public let scaledURL: URL
    public let thumbnailURL: URL
}
