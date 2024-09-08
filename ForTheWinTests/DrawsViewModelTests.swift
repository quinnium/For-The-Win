//
//  ForTheWinTests.swift
//  ForTheWinTests
//
//  Created by Quinn on 08/09/2024.
//

import XCTest
@testable import ForTheWin

final class DrawsViewModelTests: XCTestCase {
    
    class MockModelDataSource: ModelDataSourceProtocol {
        func fetchDraws() async throws -> [ForTheWin.Draw] {
            let mockDraws = MockObjects.unorderedDraws
            try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            return mockDraws
        }
    }
    
    var sut: DrawsView.ViewModel?
    
    override func setUp() {
        super.setUp()
        sut = DrawsView.ViewModel(modelDataSource: MockModelDataSource())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDrawsOrderedByGameAndThenDate() {
        guard let sut = sut else {
            XCTFail("sut is nil")
            return
        }
        let drawsReturned = sut.allDraws
        let drawsCorrectlyOrdered = drawsReturned.sorted {
            if $0.gameName == $1.gameName {
                return $0.drawDate > $1.drawDate
            } else {
                return $0.gameName < $1.gameName
            }
        }
        XCTAssertEqual(drawsReturned, drawsCorrectlyOrdered, "Incorrect order of Draws. Draws need to be ordered by gameName first, then by drawDate (most recent first)")
    }
    
    
}
