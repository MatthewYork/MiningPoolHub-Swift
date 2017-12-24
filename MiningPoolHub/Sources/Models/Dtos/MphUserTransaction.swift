//
//  MphUserTransaction.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphUserTransaction : Mappable {
    public var id: Int = 0
    public var username: String = ""
    public var type: String = ""
    public var amount: Double = 0.0
    public var coin_address: String?
    public var timestamp: String = ""
    public var txid: String?
    public var height: Int = 0
    public var blockhash: String = ""
    public var confirmations: Int?
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
        type <- map["type"]
        amount <- map["amount"]
        coin_address <- map["coin_address"]
        timestamp <- map["timestamp"]
        txid <- map["txid"]
        height <- map["height"]
        blockhash <- map["blockhash"]
        confirmations <- map["confirmations"]
    }
}
