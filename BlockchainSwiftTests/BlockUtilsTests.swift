//
//  BlockUtilsTests.swift
//  BlockchainSwiftTests
//
//  Created by Shalom Friss on 12/10/17.
//  Copyright © 2017 Shalom Friss. All rights reserved.
//

import XCTest

class BlockUtilsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGenesisBlock() {
        let gen = BlockUtils.getGenesisBlock()
        XCTAssertTrue(gen.index == 0, "Make sure the index is 0")
        XCTAssertTrue(gen.previousHash == "0", "Make sure the hash is the gen hash")
        XCTAssertTrue(gen.timestamp == BlockUtils.genDate, "Make sure the date is the gen date")
        XCTAssertTrue(gen.data == "Genesis Block", "Make sure we have the right gen data")
        XCTAssertTrue(gen.hash == "816534932c2b7154836da6afc367695e6337db8a921823784c14378abed4f7d7", "Make sure we have the right hash data")
    }
    
   
    
}
