//
//  lexer.swift
//  swift-c-compiler
//
//  Created by Quincy Poynter on 12/2/24.
//

import Foundation

/* Lexes a given file string input by tokenizing each string/character literal (Lexical Analysis)
 returns: List of Tokens to be parsed */
func tokenize(input: String) throws -> [Token] {
    
    /* Processes input into keyword or identifier token
       updates the starting index to the last index that's not part of the word
       returns token
     */
    func processWord(startIndex: inout String.Index) -> Token {
        var endIndex = input.index(after: startIndex)
        while endIndex < input.endIndex &&
                (input[endIndex].isLetter || input[endIndex].isNumber || input[endIndex] == "_") {
            endIndex = input.index(after: endIndex)
        }
        let word = String(input[startIndex..<endIndex])
        startIndex = endIndex
        
        return switch word {
        case "auto", "break", "case", "char", "const", "continue", "default", "do",
            "double", "else", "enum", "extern", "float", "for", "goto", "if", "int",
            "long", "register", "return", "short", "signed", "sizeof", "static",
            "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while":
            Token(type: .keyword(word))
        default:
            Token(type: .identifier(word))
        }
    }
    
    /* Processes input into arithemetic, relational, or assignment operator token
       updates the starting index to the last index that's not part of the operator
       returns token
     */
    func processOperator(startIndex: inout String.Index) throws -> Token {
        var endIndex = input.index(after: startIndex)
        while endIndex < input.endIndex && "+-=/*%<>!&|".contains(input[endIndex]) {
            endIndex = input.index(after: endIndex)
        }
        let op = String(input[startIndex..<endIndex])
        startIndex = endIndex
        
        return switch op {
        case "+", "-", "*", "/", "%", "++", "--":
            Token(type: .arithmetic(op))
        case "<", "<=", ">", ">=", "==", "!=", "&&", "||", "!":
            Token(type: .relational(op))
        case "=", "-=", "+=", "*=", "/=", "%=":
            Token(type: .assignment(op))
        default:
            throw TokenError.invalidToken("Invalid operator: \(op)")
        }
    }
    
    func processString(startIndex: inout String.Index) throws -> Token {
        // Start index after first double quotation mark
        startIndex = input.index(after: startIndex)
        var endIndex = startIndex
        while endIndex < input.endIndex && input[endIndex] != "\"" {
            endIndex = input.index(after: endIndex)
        }
        if endIndex == input.endIndex {
            throw TokenError.invalidToken("Missing closing quotation \"")
        }
        let str  = String(input[startIndex...endIndex])
        startIndex = input.index(after: endIndex)
        return Token(type: .string(str))
    }
    
    func processChar(startIndex: inout String.Index) throws -> Token {
        // Start index after first quotation mark
        startIndex = input.index(after: startIndex)
        var endIndex = startIndex
        while endIndex < input.endIndex && input[endIndex] != "'" {
            endIndex = input.index(after: endIndex)
        }
        if endIndex == input.endIndex {
            throw TokenError.invalidToken("Missing closing quotation '")
        }
        let str  = String(input[startIndex...endIndex])
        startIndex = input.index(after: endIndex)
        return Token(type: .character(str))
    }
    
    func processNumber(startIndex: inout String.Index) throws -> Token {
        var endIndex = input.index(after: startIndex)
        while endIndex < input.endIndex && (input[endIndex].isWholeNumber || input[endIndex] == ".") {
            endIndex = input.index(after: endIndex)
        }
        let numString = String(input[startIndex..<endIndex])
        startIndex = endIndex
        if let numInt = Int(numString) {
            return Token(type: .integer(numInt))
        }
        if let numFloat = Float(numString) {
            return Token(type: .float(numFloat))
        }
        throw TokenError.invalidToken("Invalid number: \(numString)")
        
    }
    
    var tokenBuffer: [Token] = []
    
    var i = input.startIndex
    while i < input.endIndex {
        var literal = input[i]
        switch literal {
            
        case let char where char.isWhitespace:
            continue
            
        case ";", ",", "(", ")", "{", "}":
            tokenBuffer.append(Token(type: .delimiter(literal)))
            
        case let char where char.isLetter || char == "_":
            tokenBuffer.append(processWord(startIndex: &i))
            
        case let char where "+-=/*%<>!&|".contains(char):
            tokenBuffer.append(try processOperator(startIndex: &i))
            
        case let char where char == "\"":
            tokenBuffer.append(try processString(startIndex: &i))
        
        case let char where char == "'":
            tokenBuffer.append(try processChar(startIndex: &i))
            
        case let str where literal.isWholeNumber:
            tokenBuffer.append(try processNumber(startIndex: &i))
            
        default:
            throw TokenError.invalidToken("Unrecognized character: \(literal)")
        }
    }
    
    return tokenBuffer
}

func main(file: String) -> [String] {
    return []
}
