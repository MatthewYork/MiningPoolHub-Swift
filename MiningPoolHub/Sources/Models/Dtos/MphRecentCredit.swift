//
//  MphRecentCredit.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphRecentCredit : MphCredit {
	public var date: String = ""

    // Mappable
    required public init?(map: Map) { super.init(map: map) }
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
		date <- map["date"]
	}
}
