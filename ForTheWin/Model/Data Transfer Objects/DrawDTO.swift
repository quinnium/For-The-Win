//
//  DrawDTO.swift
//  ForTheWin
//
//  Created by Quinn on 04/09/2024.
//

import Foundation

struct DrawDTO: Decodable {
    
    let gameID: Int?
    let gameName: String?
    let id: String?
    let drawDate: Date?
    let number1: String?
    let number2: String?
    let number3: String?
    let number4: String?
    let number5: String?
    let number6: String?
    let bonusBalles: [String]?
    let topPrize: Int?
}
