//
//  Euler24.swift
//  Challenges
//
//  Created by Barlow Tucker on 4/28/17.
//  Copyright © 2017 Barlow Tucker. All rights reserved.
//

import Foundation

/*
 A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
 
 012   021   102   120   201   210
 
 What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
 
 */

class Euler24 {
    class func factorial(_ num:Int) -> Int {
        var num = num
        var answer:Int = num
        
        while num > 1 {
            num = num - 1
            answer = answer * num
        }
        
        return answer
    }
    
    class func factorialBelow(_ num:Int) -> Int {
        var i = 1
        
        while self.factorial(i) < num {
            i = i + 1
        }
        
        return i - 1
    }
    
    class func nextNumber(_ num:Int, inArray array:[Int]) -> (number:Int, newBase:Int) {
        let below = self.factorialBelow(num)
        let factorial = self.factorial(below)
        let iterations = num / factorial
        
        return (array[iterations], num - (factorial * below))
    }
    
    class func solve() -> String {
        //let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        var numbers = [0, 1, 2]
        var num = 5
        var answer = ""
        var temp = 0
        
        repeat {
            let next = self.nextNumber(num, inArray: numbers)
            num = next.newBase
            answer += "\(numbers[next.number])"
            numbers.remove(at: next.number)
            temp += 1
        } while temp != 2
        
        
        return answer
    }
}
