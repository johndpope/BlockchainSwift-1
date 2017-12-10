//
//  CryptoUtils.swift
//  BlockchainSwift
//
//  Created by Shalom Friss on 12/10/17.
//  Copyright © 2017 Shalom Friss. All rights reserved.
//

import Foundation

/**
    CryptoUtils are general utilities like SHA256 computations for strings and data objects as well as hash calculations
*/
class CryptoUtils
{
    /**
     Calculate the SHA256 hash of a Data object
     @param data:Data - The data to hash
     @return Data? - A SHA256 hashed data object
    */
    static func sha256(_ data: Data) -> Data? {
        guard let res = NSMutableData(length: Int(CC_SHA256_DIGEST_LENGTH)) else { return nil }
        CC_SHA256((data as NSData).bytes, CC_LONG(data.count), res.mutableBytes.assumingMemoryBound(to: UInt8.self))
        return res as Data
    }
    
    /**
     Calculate the SHA256 hash of a String object
     @param data:String - The string to hash
     @return String? - A SHA256 hashed string object
     */
    static func sha256(_ str: String) -> String? {
        guard
            let data = str.data(using: String.Encoding.utf8),
            let shaData = sha256(data)
            else { return nil }
        let rc = shaData.base64EncodedString(options: [])
        return rc
    }
    
    /**
     Calculate the SHA256 hash of block data
     @param index:Int - The index of the block
     @param previousHash:String - The hash of the previous block
     @param timestamp:Date - The timestamp Date object of the block
     @param data:String - The data of the block
     @return String - A SHA256 hashed string object
     */
    static func calculateHash(index:Int, previousHash:String, timestamp:Date, data:String) -> String
    {
        let totalString = String(index) + previousHash + String(describing: timestamp) + data
        return CryptoUtils.sha256(totalString)!
    }
    
    /**
     Calculate the SHA256 hash of a block
     @param block:Block - The block to hash
     @return String - A SHA256 hashed string object
     */
    static func calculateHashForBlock(block:Block) -> String
    {
        let totalString = String(block.index) + block.previousHash + String(describing: block.timestamp) + block.data
        return CryptoUtils.sha256(totalString)!
    }
}
