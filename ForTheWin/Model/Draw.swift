//
//  Draw.swift
//  ForTheWin
//
//  Created by Quinn on 05/09/2024.
//

import Foundation
import RealmSwift

class Draw: Object {
    
    @Persisted var gameID: Int
    @Persisted var gameName: String
    @Persisted var id: String
    @Persisted var drawDate: Date
    @Persisted var numbers: List<Int>
    @Persisted var bonusBalls: List<Int>
    @Persisted var topPrize: Int
    
    // For intitialisation directly from a Data Transfer Object
    convenience init?(dto: DrawDTO) {
        guard   let gameID =  dto.gameId,
                let gameName = dto.gameName,
                let id = dto.id,
                let drawDate = dto.drawDate,
                let bonusBalls = dto.bonusBalls,
                let topPrize = dto.topPrize else {
            return nil
        }
                
        let dtoNumbers = [dto.number1,
                          dto.number2,
                          dto.number3,
                          dto.number4,
                          dto.number5,
                          dto.number6]
        
        self.init()
        self.gameID = gameID
        self.gameName = gameName
        self.id = id
        self.drawDate = drawDate
        self.topPrize = topPrize
        self.numbers = List<Int>()
        for string in dtoNumbers {
            if let number = Int(string ?? "") {
                self.numbers.append(number)
            }
        }
        self.bonusBalls = List<Int>()
        for string in bonusBalls {
            if let number = Int(string) {
                self.bonusBalls.append(number)
            }
        }
    }
}
