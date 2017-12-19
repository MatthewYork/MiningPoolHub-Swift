//
//  MphBalance.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/18/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphBalance : Mappable {
    public var coin: String = ""
    public var confirmed: Double = 0.0
    public var unconfirmed: Double = 0.0
    public var ae_confirmed: Double = 0.0
    public var ae_unconfirmed: Double = 0.0
    public var exchange: Double = 0.0
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        coin <- map["coin"]
        confirmed <- map["confirmed"]
        unconfirmed <- map["unconfirmed"]
        ae_confirmed <- map["ae_confirmed"]
        ae_unconfirmed <- map["ae_unconfirmed"]
        exchange <- map["exchange"]
    }
}
