//
//  main.swift
//  Challenges
//
//  Created by Barlow Tucker on 2/10/17.
//  Copyright © 2017 Barlow Tucker. All rights reserved.
//

import Foundation

let start = Date()
let answer = Problem64.test()
let end = Date()
let time = end.timeIntervalSince(start) * 1000

print("Answer: \(answer)\nFound in \(time) milliseconds")
