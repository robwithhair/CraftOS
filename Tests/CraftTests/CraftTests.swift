import XCTest
import class Foundation.Bundle

final class CraftTests: XCTestCase {
    func testEmpty() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        // Some of the APIs that we use below are available in macOS 10.13 and above.
        guard #available(macOS 10.13, *) else {
            return
        }
        
        let fooBinary = productsDirectory.appendingPathComponent("craft")
        
        let process = Process()
        process.executableURL = fooBinary
        
        let pipe = Pipe()
        let err = Pipe()
        process.standardOutput = pipe
        process.standardError = err
        
        try process.run()
        process.waitUntilExit()
        
        XCTAssertEqual(process.terminationStatus, 1)
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)
        
        let errData = err.fileHandleForReading.readDataToEndOfFile()
        let errOutput = String(data: errData, encoding: .utf8)
        
        XCTAssertEqual(output, "")
        XCTAssertEqual(errOutput, "OVERVIEW: The craft command is used to control CraftOS and start the API.\n\nUSAGE: craft <SUBCOMMAND> [options]\n\nSUBCOMMANDS:\n  serve                   Start the CraftOS API server.\n")
    }
    
    /// Returns path to the built products directory.
    var productsDirectory: URL {
        #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
        #else
        return Bundle.main.bundleURL
        #endif
    }
    
    static var allTests = [
        ("testEmpty", testEmpty),
        ]
}
