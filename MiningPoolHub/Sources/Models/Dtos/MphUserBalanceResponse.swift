//
//  MphUserBalanceResponse.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphUserBalanceResponse : Mappable {
    public var balance = MphObjectData<MphUserBalance>()
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        balance <- map["getuserbalance"]
    }
}
