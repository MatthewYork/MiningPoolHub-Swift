//
//  MphUserTransactions.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphUserTransactions : Mappable {
    public var transactions: [MphUserTransaction] = []
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        transactions <- map["transactions"]
    }
}
