//
//  MphEstimates.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphEstimates : Mappable{
	public var block: Double = 0.0
	public var fee: Int = 0
	public var donation: Int = 0
	public var payout: Double = 0.0

    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {

		block <- map["block"]
		fee <- map["fee"]
		donation <- map["donation"]
		payout <- map["payout"]
	}
}
