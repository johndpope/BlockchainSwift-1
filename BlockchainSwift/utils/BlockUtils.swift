//
//  BlockUtils.swift
//  BlockchainSwift
//
//  Created by Shalom Friss on 12/10/17.
//  Copyright © 2017 Shalom Friss. All rights reserved.
//

import Foundation

/**
    BlockUtils is a utility to aid with block creation, validation and general blockchain handling
*/
class BlockUtils
{
    //The blockchain
    static var blockchain:[Block] = [Block]()
    static var genDate:Date = Date()
    
    /**
     Get the first (Genesis) block of the blockchain
     @return Block - The first (genesis) block of the blockchain
     */
    static func getGenesisBlock() -> Block
    {
        return Block(index: 0, previousHash: "0", timestamp: BlockUtils.genDate, data: "Genesis Block", hash: "816534932c2b7154836da6afc367695e6337db8a921823784c14378abed4f7d7");
    }
    
    /**
        Generate the next block in the blockchain.
        @param block:Block - The previous block to use
        @param blockData:String - The block data to include in the new block
        @return Block - The generated block
    */
    static func generateNextBlockFromBlock(block:Block, blockData:String) -> Block
    {
        let nextIndex = block.index + 1
        let nextTimestamp = Date()
        let nextHash = CryptoUtils.calculateHash(index: nextIndex, previousHash: block.hash, timestamp: nextTimestamp, data: blockData)
        return Block(index: nextIndex, previousHash: block.hash, timestamp: nextTimestamp, data: blockData, hash: nextHash)
    }
    
    /**
        Check if a block is valid
        @param block:Block - The block to test
        @param prevBlock:Block - The previous block in the chain
    */
    static func isValidBlock(block:Block, prevBlock:Block) -> Bool
    {
        if(prevBlock.index + 1 != block.index)
        {
            return false
        }
        else if(prevBlock.hash != block.previousHash)
        {
            return false
        }
        else if(CryptoUtils.calculateHashForBlock(block: block) != block.hash)
        {
            return false
        }
        return true
    }
    
    /**
        Test if a blockchain is valid
        @param blocks:[Block] - An array of blocks to test
    */
    static func isValidChain(blocks:[Block]) -> Bool
    {
        if(blocks.count == 0)
        {
            return false
        }
        
        if(blocks[0] != BlockUtils.getGenesisBlock())
        {
            return false
        }
        
        for i in 1..<blocks.count
        {
            if(!BlockUtils.isValidBlock(block: blocks[i], prevBlock: blocks[i - 1]))
            {
                return false
            }
        }
        
        return true
    }
    
    /**
        Replace the current chain with a new one.  This only happens if the new chain is valid and is longer than the current one
        @param newChain:[Block] - The new blockchain to use
    */
    static func replaceChain(newChain:[Block])
    {
        if(BlockUtils.isValidChain(blocks: newChain) && newChain.count > BlockUtils.blockchain.count)
        {
            BlockUtils.blockchain = newChain
        }
    }
    
}
