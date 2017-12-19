//
//  MphShares.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphShares : Mappable {
	public var valid: Double = 0.0
	public var invalid: Double = 0.0
	public var invalid_percent: Double = 0.0
    public var estimated: Int = 0
	public var progress: Double = 0.0

    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
		valid <- map["valid"]
		invalid <- map["invalid"]
		invalid_percent <- map["invalid_percent"]
		estimated <- map["estimated"]
		progress <- map["progress"]
	}
}
