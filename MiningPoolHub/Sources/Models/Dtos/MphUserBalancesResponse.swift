//
//  MphUserBalancesResponse.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/18/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphUserBalancesResponse : Mappable {
    public var getuserallbalances = MphUserBalances()
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        getuserallbalances <- map["getuserallbalances"]
    }
}
