//
//  MockDraw.swift
//  ForTheWin
//
//  Created by Quinn on 07/09/2024.
//

import Foundation

struct MockObjects {
    static let draw = Draw(gameID: 1,
                           gameName: "Lotto",
                           id: "Game-1",
                           drawDate: Date(),
                           numbers: [34, 12, 9, 45, 2],
                           bonusBalls: [12, 4],
                           topPrize: 23000000)
    // For unit tests to test ordering
    static var unorderedDraws: [Draw] {
        let gameIDArray     = [2, 2, 1, 1, 2]
        let gameNameArray   = ["Lotto Plus", "Lotto Plus", "Lotto", "Lotto", "Lotto Plus"]
        let idArray         = ["draw-5", "draw-2", "draw-1", "draw-3", "draw-4"]
        let drawDateArray   = [Date().addingDays(-3) ?? Date(),
                               Date().addingDays(1) ?? Date(),
                               Date().addingDays(-100) ?? Date(),
                               Date().addingDays(+400) ?? Date(),
                               Date().addingDays(0) ?? Date()]
        let numbersArray    = [[34, 12, 9, 45, 2],
                               [34, 1, 9, 45, 2],
                               [4, 12, 49, 45, 2],
                               [34, 12, 9, 45, 29],
                               [39, 12, 50, 5, 2]]
        let bonusBallsArray = [[44, 2],
                               [12,16],
                               [18, 2],
                               [3,40],
                               [22, 1]]
        let topPrizeArray   = [200, 72000000, 34000000, 2000000, 11000100]
        
        var unorderedArray: [Draw] = []
        for index in 0..<5 {
            let draw = Draw(gameID: gameIDArray[index],
                            gameName: gameNameArray[index],
                            id: idArray[index],
                            drawDate: drawDateArray[index],
                            numbers: numbersArray[index],
                            bonusBalls: bonusBallsArray[index],
                            topPrize: topPrizeArray[index])
            unorderedArray.append(draw)
        }
        return unorderedArray
    }
}
