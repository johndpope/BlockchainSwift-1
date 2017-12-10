//
//  BlockTests.swift
//  BlockchainSwiftTests
//
//  Created by Shalom Friss on 12/10/17.
//  Copyright © 2017 Shalom Friss. All rights reserved.
//

import XCTest

class BlockTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBlockCreation()
    {
        let date = Date()
        let block = Block(index: 1, previousHash: "asdf123", timestamp: date, data: "test data", hash: "asdf1234")
        XCTAssert(block.index == 1 && block.previousHash == "asdf123" && block.timestamp == date && block.data == "test data" && block.previousHash == "asdf123", "Make sure a block actually contains the data it was initialized with")
    }
    
    func testBlockEquality()
    {
        let date1 = Date()
        let date2 = Date()
        let block1 = Block(index: 1, previousHash: "asdf123", timestamp: date1, data: "test data", hash: "asdf1234")
        
        let block2 = Block(index: 1, previousHash: "asdf123", timestamp: date1, data: "test data", hash: "asdf1234")
        
        let block3 = Block(index: 1, previousHash: "asdf123 2", timestamp: date2, data: "test data 2", hash: "asdf1234 2")
        
        XCTAssertTrue(block1 == block1, "Make sure a block is equal to itself")
        XCTAssertTrue(block1 == block2, "Make sure blocks with the same data are equal")
        XCTAssertTrue(block1 != block3, "Make sure blocks with different data are NOT equal")
    }
    
}
