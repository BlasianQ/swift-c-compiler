//
//  main.swift
//  swift-c-compiler
//
//  Created by Quincy Poynter on 12/2/24.
//

import Foundation

func main() throws {
    if CommandLine.arguments.count != 2 {
        throw CommandLineError.invalidArguments("Expected 2 arguments but \(CommandLine.arguments.count) were given.")
    }
    let fileName = CommandLine.arguments[1]
    if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        
        do {
            let fileContent = try String(contentsOf: fileURL, encoding: .utf8)
            print("File Content: \n\(fileContent)")
        } catch {
            print("Error reading file: \(error)")
        }
    }
}

do {
//    try main()
    print("before calling test")
    let t = try test()
    print(t)
} catch {
    print(error)
}
