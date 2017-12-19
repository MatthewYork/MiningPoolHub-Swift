//
//  MphBlock.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphBlock : Mappable {
    public var id: Int = 0
    public var height: Int = 0
    public var blockhash: String = ""
    public var confirmations: Int = 0
    public var amount: Int = 0
    public var difficulty: Int = 0
    public var time: Int = 0
    public var accounted: Int = 0
    public var account_id: Int = 0
    public var worker_name: String = ""
    public var shares: Int = 0
    public var share_id: Int = 0
    public var finder: String = ""
    public var is_anonymous: Int = 0
    public var estshares: Int = 0
    
    init() { }
    
    // Mappable
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        height <- map["height"]
        blockhash <- map["blockhash"]
        confirmations <- map["confirmations"]
        amount <- map["amount"]
        difficulty <- map["difficulty"]
        time <- map["time"]
        accounted <- map["accounted"]
        account_id <- map["account_id"]
        worker_name <- map["worker_name"]
        shares <- map["shares"]
        share_id <- map["share_id"]
        finder <- map["finder"]
        is_anonymous <- map["is_anonymous"]
        estshares <- map["estshares"]
    }
}
