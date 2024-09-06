//
//  DrawDTO.swift
//  ForTheWin
//
//  Created by Quinn on 04/09/2024.
//

import Foundation

struct DrawDTO: Decodable {
    
    let gameId: Int?
    let gameName: String?
    let id: String?
    let drawDate: Date?
    let number1: String?
    let number2: String?
    let number3: String?
    let number4: String?
    let number5: String?
    let number6: String?
    let bonusBalls: [String]?
    let topPrize: Int?
    
    enum CodingKeys: String, CodingKey {
        case gameId
        case gameName
        case id
        case drawDate
        case number1
        case number2
        case number3
        case number4
        case number5
        case number6
        case bonusBalls = "bonus-balls"
        case topPrize
    }
}
