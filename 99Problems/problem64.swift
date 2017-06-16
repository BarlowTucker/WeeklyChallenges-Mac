//
//  problem64.swift
//  Challenges
//
//  Created by Barlow Tucker on 6/16/17.
//  Copyright © 2017 Barlow Tucker. All rights reserved.
//

import Foundation

class Tree<T> {
    let value: T
    var left: Tree<T>?
    var right: Tree<T>?
    
    init(_ value:T, left:Tree<T>? = nil, right: Tree<T>? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    func goLeft(x xOffset:Int = 0, y:Int = 1) -> Int {
        let currentX = (self.left?.goLeft(x: xOffset, y: y + 1) ?? 1)
        let x = self.left == nil ? currentX + xOffset : currentX
        let positioned = PositionedTree(self.value, position:(x: x, y: y))
        print("---------------\n\(self.value): { x:\(x), y:\(y) }")
        
        let right = self.right?.goLeft(x: x, y: y + 1) ?? 0
        
        return max(x + 1, right)
    }
    
    func layoutBinaryTree() -> PositionedTree<T> {
        return PositionedTree(self.value, position:(x:1, y:1))
    }
}

class PositionedTree<T>: Tree<T> {
    var position: (x:Int, y:Int)
    
    init(_ value:T, position:(x:Int, y:Int), left:Tree<T>? = nil, right: Tree<T>? = nil) {
        self.position = position
        super.init(value, left: left, right: right)
    }
}

class Problem64 {
    class func test() -> String {
        let tree = Tree("n", left:Tree("k", left:Tree("c", left:Tree("a"), right:Tree("h", left:Tree("g", left:Tree("e")))), right:Tree("m")), right:Tree("u", left:Tree("p", right:Tree("s", left:Tree("q")))))
        tree.goLeft()
        return "done"
    }
}

