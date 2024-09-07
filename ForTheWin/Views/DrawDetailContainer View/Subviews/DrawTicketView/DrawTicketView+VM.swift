//
//  DrawTicketView+VM.swift
//  ForTheWin
//
//  Created by Quinn on 07/09/2024.
//

import Foundation

extension DrawTicketView {
    class ViewModel: ObservableObject {
        
        let draw: Draw
        let ticket = DrawTicket()
        
        init(draw: Draw) {
            self.draw = draw
        }
        
        var winningStatusString: String {
            var winningNumberCount = 0
            for number in ticket.numbers {
                if draw.numbers.contains(number) {
                    winningNumberCount += 1
                }
            }
            switch winningNumberCount {
                case 0:
                    return "You haven't matched any numbers, better luck next time"
                case ticket.numbers.count:
                    return "CONGRATULATIONS! You've just won £\(draw.topPrize) by matching all your numbers!"
                default:
                    return "You've matched \(winningNumberCount) out of \(ticket.numbers.count) numbers"
            }
        }
    }
}
