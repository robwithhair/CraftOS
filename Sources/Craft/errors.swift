//
//  errors.swift
//  Craft
//
//  Created by Robert Harrison on 02/10/2018.
//

import Foundation
import Utility

func print(errorMessage: String) {
    guard let data = ( errorMessage + "\n" ).data(using: .utf8) else {
        return
    }
    FileHandle.standardError.write(data)
}

func handle(error: Error) {
    print(errorMessage: error.localizedDescription)
    exit(1)
}

func handle(error: ArgumentParserError) {
    print(errorMessage: error.description + "\n")
    handle(error: error as Error)
}
