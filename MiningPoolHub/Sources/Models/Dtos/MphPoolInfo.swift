//
//  MphPoolInfo.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper
 
public class MphPoolInfo {
	public var name: String = ""
	public var currency: String = ""
    
    init() { }

    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
		name <- map["name"]
		currency <- map["currency"]
	}
}
