//
//  MphUserShareRateResponse.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphUserShareRateResponse : Mappable {
    public var rate = MphDoubleData()
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        rate <- map["getusersharerate"]
    }
}
