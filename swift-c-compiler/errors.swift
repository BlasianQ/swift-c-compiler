//
//  errors.swift
//  swift-c-compiler
//
//  Created by Quincy  Poynter on 12/3/24.
//

enum CommandLineError: Error {
    case invalidArguments(String)
    case readFileError(String)
}

enum TokenError: Error {
    case invalidToken(String)
}
