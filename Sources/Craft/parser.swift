//
//  parser.swift
//  Craft
//
//  Created by Robert Harrison on 02/10/2018.
//

import Foundation
import Utility

func parser() -> ArgumentParser {
    return addCommands(toParser: ArgumentParser(usage: "<SUBCOMMAND> [options]", overview: "The craft command is used to control CraftOS and start the API."))
}

func addCommands(toParser parser: ArgumentParser) -> ArgumentParser {
    return addServeCommand(toParser: parser)
}

func addServeCommand(toParser parser: ArgumentParser) -> ArgumentParser {
    let serveParser = parser.add(subparser: "serve", overview: "Start the CraftOS API server.")
    _ = serveParser.add(positional: "PATH", kind: String.self, optional: false, usage: "The URL from which to serve", completion: ShellCompletion.filename)
    //let webRoot = serveParser.add(positional: "webRoot", kind: String.self)
    return parser
}
