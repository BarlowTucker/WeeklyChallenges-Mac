//
//  Euler185.swift
//  Challenges
//
//  Created by Barlow Tucker on 8/4/17.
//  Copyright © 2017 Barlow Tucker. All rights reserved.
//

import Foundation

extension Int {
    func toArray() -> [Int] {
        var number = self
        var digits:[Int] = []
        
        while number > 0 {
            digits.append(number % 10)
            number /= 10
        }
        
        return digits.reversed()
    }
}

struct Guess {
    let number:Int
    let matches:Int
    let numberSize:Int
    private let array:[Int]
    
    init(number:Int, matches:Int) {
        self.number = number
        self.matches = matches
        self.array = number.toArray()
        self.numberSize = self.array.count
    }
    
    func possibleMatch(_ number: [Int]) -> Bool {
        guard number.count == self.array.count else { return false }
        var matchCount:Int = 0
        
        for (index, currentValue) in array.enumerated() {
            guard matchCount <= self.matches else { return false }
            if currentValue == number[index] {
                matchCount += 1
            }
        }
        
        return matchCount == self.matches
    }
}

class Euler185 {
    let numberSize:Int
    let guesses:[Guess]
    let nonGuess:[Guess]
    var tries:[String] = []
    
    init(guesses:[Guess]) {
        self.numberSize = guesses.first?.numberSize ?? 0
        self.guesses = guesses
        
        var non:[Guess] = []
        
        for guess in guesses {
            guard guess.matches == 0 else { continue }
            non.append(guess)
        }
        self.nonGuess = non
    }
    
    func testList(_ number:[Int]) -> Bool {
        guard number.count == self.numberSize else { return false }
        
        for guess in self.guesses {
            guard guess.possibleMatch(number) else { return false }
        }
        
        return true
    }
    
    func solve() -> String {
        let low:Int = Int(pow(10.0, Double(self.numberSize - 1)))
        let high:Int = Int(pow(10.0, Double(self.numberSize))) - 1
        var i = low
        
        while i <= high {
            let array = i.toArray()
            guard !self.testList(array) else { return "\(i)" }
            i += 1
        }
        
        return "Not found in range - \(low) to \(high)"
    }
    
    class func test() -> String {
        let guesses:[Guess] = [Guess(number:90342, matches:2),
                               Guess(number:70794, matches:0),
                               Guess(number:39458, matches:2),
                               Guess(number:34109, matches:1),
                               Guess(number:51545, matches:2),
                               Guess(number:12531, matches:1)]
        let euler = Euler185(guesses:guesses)
//        let guesses:[Guess] = [Guess(number:5616185650518293, matches: 2),
//            Guess(number:3847439647293047, matches: 1),
//            Guess(number:5855462940810587, matches: 3),
//            Guess(number:9742855507068353, matches: 3),
//            Guess(number:4296849643607543, matches: 3),
//            Guess(number:3174248439465858, matches: 1),
//            Guess(number:4513559094146117, matches: 2),
//            Guess(number:7890971548908067, matches: 3),
//            Guess(number:8157356344118483, matches: 1),
//            Guess(number:2615250744386899, matches: 2),
//            Guess(number:8690095851526254, matches: 3),
//            Guess(number:6375711915077050, matches: 1),
//            Guess(number:6913859173121360, matches: 1),
//            Guess(number:6442889055042768, matches: 2),
//            Guess(number:2321386104303845, matches: 0),
//            Guess(number:2326509471271448, matches: 2),
//            Guess(number:5251583379644322, matches: 2),
//            Guess(number:1748270476758276, matches: 3),
//            Guess(number:4895722652190306, matches: 1),
//            Guess(number:3041631117224635, matches: 3),
//            Guess(number:1841236454324589, matches: 3),
//            Guess(number:2659862637316867, matches: 2)]
//        let euler = Euler185(guesses:guesses)
        
        return euler.solve()
    }
}
