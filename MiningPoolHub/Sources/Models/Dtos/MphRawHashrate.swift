//
//  MphRawHashrate.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphRawHashrate : Mappable {
    public var hashrate: Double = 0.0
    public var esttimeperblock: Int?
    
    init() { }
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        hashrate <- map["hashrate"]
        esttimeperblock <- map["esttimeperblock"]
    }
}
