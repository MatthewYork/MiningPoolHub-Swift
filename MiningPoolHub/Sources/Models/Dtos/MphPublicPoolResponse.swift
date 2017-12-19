//
//  MphPublicPoolResponse.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphPublicPoolResponse : Mappable {
    public var pool_name: String = ""
    public var hashrate: Double = 0.0
    public var workers: Int = 0
    public var shares_this_round: Double = 0.0
    public var last_block: Int = 0
    public var network_hashrate: Double = 0.0
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        pool_name <- map["pool_name"]
        hashrate <- map["hashrate"]
        workers <- map["workers"]
        shares_this_round <- map["shares_this_round"]
        last_block <- map["last_block"]
        network_hashrate <- map["network_hashrate"]
    }
}
