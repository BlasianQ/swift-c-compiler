//
//  lexer.swift : parses a given file by tokenizing each string literal (Lexical Analysis)
//  swift-c-compiler
//
//  Created by Quincy Poynter on 12/2/24.
//

import Foundation

func tokenize(input: String) throws -> [Token] {
    var tokenBuffer: [Token] = []
            
    var i = input.startIndex
    while i < input.endIndex {
        var tokenLiteral = input[i]
        switch tokenLiteral {
        case let str where str.isWhitespace:
            continue
        case ";", ",", "(", ")", "{", "}":
            tokenBuffer.append(Token(type: .delimiter(tokenLiteral)))
        case let str where tokenLiteral.isLetter:
            print("hello")
//            while loop here to see if keyword/identifier
        case let str where tokenLiteral.isNumber:
            
            print("haha")
        default:
            print("default")
        }
    }
    
    return tokenBuffer
}

func main(file: String) -> [String] {
    return []
}
