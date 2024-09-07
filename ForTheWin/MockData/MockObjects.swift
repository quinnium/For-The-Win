//
//  MockDraw.swift
//  ForTheWin
//
//  Created by Quinn on 07/09/2024.
//

import Foundation

struct MockObjects {
    static let drawDTO = DrawDTO(gameId: 1,
                                 gameName: "Lotto",
                                 id: "Game-1",
                                 drawDate: Date(),
                                 number1: "34",
                                 number2: "12",
                                 number3: "9",
                                 number4: "45",
                                 number5: "2",
                                 number6: nil,
                                 bonusBalls: ["12", "4"],
                                 topPrize: 2300000)
    
    static let draw = Draw(dto: drawDTO)!
}
