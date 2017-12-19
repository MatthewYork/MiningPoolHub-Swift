//
//  MphPool.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphPool : Mappable {
	public var info: MphPoolInfo = MphPoolInfo()
	public var workers: Int = 0
	public var hashrate: Double = 0.0
	public var shares: MphShares = MphShares()
	public var price: String = ""
	public var difficulty: Int = 0
	public var target_bits: Int = 0

    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
		info <- map["info"]
        workers <- map["workers"]
		hashrate <- map["hashrate"]
		shares <- map["shares"]
		price <- map["price"]
		difficulty <- map["difficulty"]
		target_bits <- map["target_bits"]
	}
}
