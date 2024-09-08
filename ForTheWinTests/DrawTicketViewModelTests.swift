//
//  DrawTicketViewModelTests.swift
//  ForTheWinTests
//
//  Created by Quinn on 08/09/2024.
//

import XCTest
@testable import ForTheWin

final class DrawTicketViewModelTests: XCTestCase {

    var sut: DrawTicketView.ViewModel?
    
    override func setUp() {
        super.setUp()
        let draw = Draw(gameID: 0, gameName: "", id: "", drawDate: Date(), numbers: [1,22,50,10,15], bonusBalls: [34,11], topPrize: 1)
        sut = DrawTicketView.ViewModel(draw: draw, ticket: DrawTicket())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testTicketNumberSorting() {
        guard let sut = sut else {
            XCTFail("sut is nil")
            return
        }
        let ticketNumbers = sut.ticketNumbers
        
        var isSorted = true
        for i in 0..<ticketNumbers.count - 1 {
            if ticketNumbers[i] > ticketNumbers[i + 1] {
                isSorted = false
                break
            }
        }
        XCTAssertTrue(isSorted, "ticketNumbers array is not sorted properly. Must be ordered in ascending order")
    }
    
    func testIsWinningNumberTrue() {
        guard let sut = sut else {
            XCTFail("sut is nil")
            return
        }
        let number = 15
        let isWinningNumber = sut.isWinningNumber(number)
        XCTAssertTrue(isWinningNumber, "Number should be considered a winning number")
    }
    
    func testIsWinningNumberFalse() {
        guard let sut = sut else {
            XCTFail("sut is nil")
            return
        }
        let number = 12
        let isWinningNumber = sut.isWinningNumber(number)
        XCTAssertFalse(isWinningNumber, "Number should not be considered a winning number")
    }

}
