//
//  DrawTicket.swift
//  ForTheWin
//
//  Created by Quinn on 07/09/2024.
//

import Foundation

struct DrawTicket {
    var numbers: Set<Int> = []
    
    init() {
        while numbers.count < 5 {
            self.numbers.insert(Int.random(in: 1...50))
        }
    }
}
