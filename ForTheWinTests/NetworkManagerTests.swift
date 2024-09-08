//
//  NetworkManagerTests.swift
//  ForTheWinTests
//
//  Created by Quinn on 08/09/2024.
//

import XCTest
@testable import ForTheWin

final class NetworkManagerTests: XCTestCase {

    var sut: NetworkManager?
    
    override func setUp() {
        super.setUp()
        sut = NetworkManager(jsonSource: .localFile)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDrawsReturnedFromJSON() async {
        guard let sut = sut else {
            XCTFail("sut is nil")
            return
        }
        do {
            let drawsReturned = try await sut.getDraws()
            XCTAssertNotNil(drawsReturned)
            XCTAssert(drawsReturned.count == 5, "sut returned a Draw count that differed from the expected 5")
        } catch {
            XCTFail("NetworkManager failed at attempting to return draws")
        }
        
    }
}
