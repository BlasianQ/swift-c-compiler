//
//  token.swift : class for representing a token
//  swift-c-compiler
//
//  Created by Quincy Poynter on 12/2/24.
//

enum TokenType {
    case identifier(String)
    case keyword(String)
    case delimiter(Character)
    case arithmetic(String)
    case relational(String)
    case assignment(String)
    case integer(Int)
    case float(Float)
    case string(String)
    case character(Character)
}

struct Token {
    let type: TokenType
}
