//
//  MphPersonalDashboard.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphPersonalDashboard : Mappable {
	public var hashrate: Double = 0.0
	public var sharerate: Int = 0
	public var sharedifficulty: Int = 0
	public var shares: MphShares = MphShares()
	public var estimates: MphEstimates = MphEstimates()


    init() { }
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
		hashrate <- map["hashrate"]
		sharerate <- map["sharerate"]
		sharedifficulty <- map["sharedifficulty"]
        shares <- map["shares"]
        estimates <- map["estimates"]
	}
}
