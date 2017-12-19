//
//  MphPoolStatus.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphPoolStatus : Mappable {
    public var pool_name: String = ""
    public var hashrate: Double = 0.0
    public var efficiency: Double = 0.0
    public var workers: Int = 0
    public var currentnetworkblock: Int = 0
    public var nextnetworkblock: Int = 0
    public var lastblock: Int = 0
    public var networkdiff: Int = 0
    public var esttime: Double = 0.0
    public var estshares: Int = 0
    public var timesincelast: Double = 0.0
    public var nethashrate: Double = 0.0
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        pool_name <- map["pool_name"]
        hashrate <- map["hashrate"]
        efficiency <- map["efficiency"]
        workers <- map["workers"]
        currentnetworkblock <- map["currentnetworkblock"]
        nextnetworkblock <- map["nextnetworkblock"]
        lastblock <- map["lastblock"]
        networkdiff <- map["networkdiff"]
        esttime <- map["esttime"]
        estshares <- map["estshares"]
        timesincelast <- map["timesincelast"]
        nethashrate <- map["nethashrate"]
    }
}
