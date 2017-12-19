//
//  MphUserStatus.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphUserStatus : Mappable {
    public var username: String = ""
    public var shares: MphUserStatusShares = MphUserStatusShares()
    public var hashrate: Double = 0.0
    public var sharerate: Double = 0.0
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        username <- map["username"]
        shares <- map["shares"]
        hashrate <- map["hashrate"]
        sharerate <- map["sharerate"]
    }
}
