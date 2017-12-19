//
//  MphRawDashboard.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphRawDashboard : Mappable {
	public var personal: MphRawHashrate = MphRawHashrate()
	public var pool: MphRawHashrate = MphRawHashrate()
	public var network: MphRawHashrate = MphRawHashrate()

    init() { }
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        personal <- map["personal"]
        pool <- map["pool"]
        network <- map["network"]
	}
}
