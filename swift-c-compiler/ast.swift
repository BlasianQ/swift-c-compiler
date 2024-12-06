//
//  ast.swift
//  swift-c-compiler
//
//  Created by Quincy  Poynter on 12/4/24.

protocol ASTNodeType {}


// Protocol representing a node in an Abstract Syntax Tree (AST)
protocol ASTNode {
    
    var children: [ASTNode] { get }
    
    func accept(visitor: ASTVisitor)
}

struct ProgramNode: ASTNode {
    
    var value: FunctionDeclarationNode
    
    var children: [any ASTNode]
    
    func accept(visitor: any ASTVisitor) {
        <#code#>
    }
}

struct FunctionDeclarationNode: ASTNode {
    
    let name: String
    
    var statement: StatementNode
    
    var children: [any ASTNode]
    
    func accept(visitor: any ASTVisitor) {
        <#code#>
    }
}

struct StatementNode: ASTNode {
    
    enum StatementType : ASTNodeType {
        case returnNode(ReturnNode)
        case assignNode(AssignNode)
    }

    var children: [ASTNode]
    // TODO: make this a class, pass in nodetype param, then switch statement to see which type to assign to children arr
    // TODO: maybe try making seperate structs that don't inherit from anything. Then create an enum for ASTNode whose cases are nodeStructs
    func accept(visitor: any ASTVisitor) {
        <#code#>
    }
}

struct ReturnNode: ASTNode {
    var children: [any ASTNode]
    
    func accept(visitor: any ASTVisitor) {
        <#code#>
    }
    
    
}

struct AssignNode: ASTNode {
    var children: [any ASTNode]
    
    func accept(visitor: any ASTVisitor) {
        <#code#>
    }
    
    
}


protocol ASTVisitor {
    
}

func test() {
    let x = ReturnNode(children: []) as ASTNode
}
