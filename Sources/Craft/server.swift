//
//  server.swift
//  Basic
//
//  Created by Robert Harrison on 02/10/2018.
//

import Foundation
import Vapor
import Logging


/// Echoes the request as a response.
struct EchoResponder: HTTPServerResponder {
    /// See `HTTPServerResponder`.
    func respond(to req: HTTPRequest, on worker: Worker) -> Future<HTTPResponse> {
        // Create an HTTPResponse with the same body as the HTTPRequest
        let logger = PrintLogger()
        logger.info("made request to \(req.url.absoluteString)")
        let res = HTTPResponse(body: req.body)
        
        // We don't need to do any async work here, we can just
        // se the Worker's event-loop to create a succeeded future.
        return worker.eventLoop.newSucceededFuture(result: res)
    }
}

func serve() throws {
    // Create an EventLoopGroup with an appropriate number
    // of threads for the system we are running on.
    let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
    // Make sure to shutdown the group when the application exits.
    defer { try! group.syncShutdownGracefully() }
    
    // Start an HTTPServer using our EchoResponder
    // We are fine to use `wait()` here since we are on the main thread.
    let server = try HTTPServer.start(
        hostname: "localhost",
        port: 8123,
        responder: EchoResponder(),
        on: group
        ).wait()
    
    // Wait for the server to close (indefinitely).
    try server.onClose.wait()
}


