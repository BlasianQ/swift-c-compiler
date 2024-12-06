//
//  lexerTests.swift
//  swift-c-compiler
//
//  Created by Quincy  Poynter on 12/4/24.
//
//import Testing
//
//@Suite("Keyword and Identifier Tests")
//struct LexerTests {
//    @Test func parseKeyword() async throws {
//        #expect(true == true)
//    }
//}

func test() throws -> [Token] {
    let file = """
                int main() {
                    return 2;
                }
                """
    return try tokenize(input: file)
}
