//
//  SwitchPair.swift
//  Challenges
//
//  Created by Barlow Tucker on 7/3/17.
//  Copyright © 2017 Barlow Tucker. All rights reserved.
//

import Foundation

struct Stack<Element:Hashable> {
    fileprivate var values:[Element]
    
    var count:Int {
        return self.values.count
    }
    
    init(_ values: [Element]) {
        self.values = values
    }
    
    mutating func push(_ item:Element) {
        self.values.append(item)
    }
    
    mutating func pop() -> Element? {
        return self.values.popLast()
    }
}

extension Stack:Sequence {
    typealias Iterator = IndexingIterator<Array<Element>>
    
    func makeIterator() -> Iterator {
        return self.values.makeIterator()
    }
}

class SwitchPair {
    class func switchStack(_ stack:Stack<Int> = Stack([3, 8, 17, 9, 99, 9, 17, 8, 3, 1, 2, 3, 4, 14])) -> Stack<Int> {
        var switched: Stack<Int> = Stack([])
        var newFirst:Int? = nil
        
        for item in stack {
            if let first = newFirst {
                switched.push(first)
                switched.push(item)
                newFirst = nil
            } else {
                newFirst = item
            }
        }
        
        if let first = newFirst {
            switched.push(first)
        }
        
        return switched
    }
    
    class func test() -> String {
        return "\(self.switchStack())"
    }
}
