//
//  Block.swift
//  BlockchainSwift
//
//  Created by Shalom Friss on 12/10/17.
//  Copyright © 2017 Shalom Friss. All rights reserved.
//

import Foundation

/**
    A block object
 */
class Block : Equatable
{
    var index:Int = 0
    var previousHash:String = ""
    var timestamp:Date = Date()
    var data:String = ""
    var hash:String = ""
    
    /**
     Initialize a block
     @param index:Int - The index of the block
     @param previousHash:String - The hash of the previous block
     @param timestamp:Date - The timestamp Date object of the block
     @param data:String - The data of the block
     @param hash:String - The hash of the block
    */
    init(index:Int, previousHash:String, timestamp:Date, data:String, hash:String)
    {
        self.index = index
        self.previousHash = previousHash
        self.timestamp = timestamp
        self.data = data
        self.hash = hash
    }
    
    static func ==(lhs:Block, rhs:Block) -> Bool
    {
        return lhs.index == rhs.index && lhs.previousHash == rhs.previousHash && lhs.timestamp == rhs.timestamp && lhs.data == rhs.data && lhs.hash == rhs.hash
    }
}
