//
//  main.swift
//  swift-c-compiler
//
//  Created by Quincy  Poynter on 12/2/24.
//

import Foundation

enum CommandLineError: Error {
    case invalidArguments(String)
}

func main() throws {
    if CommandLine.arguments.count != 2 {
        throw CommandLineError.invalidArguments("Expected 2 arguments but \(CommandLine.arguments.count) were given ")
    }
    let file = CommandLine.arguments[1]
    // TODO: compile the file into x86 assembly
}

do {
    try main()
} catch {
    print(error)
}
