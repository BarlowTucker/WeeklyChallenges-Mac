//
//  WordDictionary.swift
//  Challenges
//
//  Created by Barlow Tucker on 2/10/17.
//  Copyright © 2017 Barlow Tucker. All rights reserved.
//

import Cocoa

class WordDictionary {
    class func words() -> [String] {
        let strings:[String] = try! String(contentsOfFile: "/Users/barlow/Documents/Development/Challenges/Challenges/Challenges/Challenges/dictionary.txt", encoding: .utf8).components(separatedBy: .newlines)
        
        return strings
    }
}
