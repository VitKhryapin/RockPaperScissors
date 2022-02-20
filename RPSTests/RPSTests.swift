//
//  RPSTests.swift
//  RPSTests
//
//  Created by Кот on 25.10.2021.
//

import XCTest
@testable import RPS

class RPSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRockResult() {
        let sign = Sign.rock
        print(sign)
        print(sign.emoji)
        XCTAssert(sign.getResult(.rock) == .draw)
        XCTAssert(sign.getResult(.paper) == .lose)
        XCTAssert(sign.getResult(.scissors) == .win)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    }
