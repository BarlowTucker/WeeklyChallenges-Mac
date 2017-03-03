//
//  Euler14.swift
//  Challenges
//
//  Created by Barlow Tucker on 2/17/17.
//  Copyright © 2017 Barlow Tucker. All rights reserved.
//

import Cocoa

class Euler14 {
    class func jumps(_ number:Int ) -> Int {
        var jumps:Int = 1
        var currentNumber: Int = number
        
        while currentNumber != 1 {
            jumps += 1
            
            if currentNumber % 2 == 0 {
                currentNumber = currentNumber / 2
            } else {
                currentNumber = ((3 * currentNumber) + 1) / 2
                jumps += 1
            }
        }
        
        return jumps
    }
    
    class func solve() -> String {
        var longestLength:Int = 0
        var number:Int = 999999
        
        for i in 0...number/2 {
            let currentNumber = 999999-i
            let length:Int = self.jumps(currentNumber)
            
            if length > longestLength {
                longestLength = length
                number = currentNumber
            }
        }
        
        return "\(number) creates the longest chain: \(longestLength)"

    }
}


//class func sequence(_ number:Int ) -> Int {
//    var jumps:Int = 1
//    var currentNumber: Int = number
//    
//    while currentNumber != 1 {
//        jumps += 1
//        
//        let isEven: Bool = currentNumber % 2 == 0
//        currentNumber = isEven ? (currentNumber / 2) : (3 * currentNumber) + 1
//    }
//    
//    return jumps
//}

//class func jumps(_ number:Int, jumps:Int = 1) -> Int {
//    guard number != 1 else { return jumps }
//    
//    let isEven: Bool = number % 2 == 0
//    let next = isEven ? (number / 2) : (3 * number) + 1
//    return self.jumps(next, jumps: jumps + 1)
//}

//    class func sequence(_ number:Int) -> [Int] {
//        var currentSequence: [Int] = [number]
//        guard number != 1 else { return currentSequence }
//
//        let isEven: Bool = number % 2 == 0
//        let nextNumber:Int
//
//        if isEven {
//            nextNumber = number / 2
//        } else {
//            nextNumber = (3 * number) + 1
//        }
//
//        currentSequence.append(contentsOf: self.sequence(nextNumber))
//
//        return currentSequence
//    }

//    class func solve() -> String {
//        var longest:Int = 0
//        var longestSequence:[Int] = []
//
//        for i in 0...999998 {
//            let number = 999999-i
//            let solution:[Int] = self.sequence(number)
//            let length:Int = solution.count
//
//            if length > longest {
//                longest = length
//                longestSequence = solution
//            }
//        }
//
//        return "\nSequence: \(longestSequence)\nLength:\(longest)"
//    }
