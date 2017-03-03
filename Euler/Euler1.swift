//
//  Euler1.swift
//  Challenges
//
//  Created by Barlow Tucker on 3/3/17.
//  Copyright © 2017 Barlow Tucker. All rights reserved.
//

import Cocoa

class Euler1 {
    /**
     easyToMaintainCode runs around 2 milliseconds
     */
    class func easyToMaintainCode() -> Int {
        var i:Int = 999
        var sum:Int = 0
        
        while i > 0 {
            defer { i -= 1 }
            guard i % 3 == 0 || i % 5 == 0 else { continue }
            sum += i
        }
        
        return sum
    }
    
    /**
     fasterSolution runs in around 0.6 milliseconds
     */
    class func fasterSolution() -> Int {
        //Solve multiples of 3
        var i:Int = 999
        var threeSum:Int = 0
        var fiveSum:Int = 0
        
        while i > 0 {
            threeSum += i
            i -= 3
        }
        
        //Solve for multiples of 5
        i = 995
        while i > 0 {
            defer { i -= 5 }
            guard i % 3 != 0 else { continue }
            fiveSum += i
        }
        
        return threeSum + fiveSum
    }
    
    /**
     fastestSolution runs in around 0.3 milliseconds
        
        This solution works by finding the total for multiples of 3, 5, and 15 using this formula:
            n * (999/n + 1)/2
        Then we add the multiples of 3 and 5, and subtract the multiples of 15 (because they would be counted twice)
     
     */
    @inline(__always) class func fastestSolution(_ limit: Int) -> Int {
        let threes:Int = self.sumOfMultiples(of: 3, under: limit)
        let fives:Int = self.sumOfMultiples(of: 5, under: limit)
        let fifteens: Int = self.sumOfMultiples(of: 15, under: limit)
        
        return threes + fives - fifteens
    }
    
    @inline(__always) class func sumOfMultiples(of number: Int, under:Int) -> Int {
        let multiples:Int = (under - 1) / number
        return number * multiples * (multiples + 1)/2
    }
    
    class func solve() -> String {
        let limit:Int = 1000
        let sum = self.fastestSolution(limit)
        
        return "The sum of all the multiples of 3 or 5 under \(limit) is \(sum)"
    }
}
