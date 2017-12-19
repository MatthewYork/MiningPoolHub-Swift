//
//  MphDashboardBalanceForAutoExchange.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphDashboardBalance : Mappable {
	public var confirmed: Double = 0.0
	public var unconfirmed: Double = 0.0
	public var orphaned: Double = 0.0

    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
		confirmed <- map["confirmed"]
		unconfirmed <- map["unconfirmed"]
		orphaned <- map["orphaned"]
	}
}
