import Foundation
import Utility
import Basic

func prepare(arguments: [String]) -> [String] {
    return Array(arguments.dropFirst())
}

func main(withArguments arguments: [String]) throws {
    let parse = parser()
    let parsedArguments = try parse.parse(prepare(arguments: arguments))
    guard let subparser = parsedArguments.subparser(parse) else {
        parse.printUsage(on: stderrStream)
        exit(1)
    }
    print("gotToSubparser")
    switch subparser {
    case "serve":
        try serve()
    default:
        break
    }
    print("command: \(subparser)")
    print("args: \(parsedArguments)")
}

do {
    try main(withArguments: ProcessInfo.processInfo.arguments )
} catch let error as ArgumentParserError {
    handle(error: error)
} catch let error {
    handle(error: error)
}
