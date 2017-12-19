//
//  MphBlocksFoundResponse.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphBlocksFoundResponse : Mappable {
    public var blocks = MphBlocksFound()
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        blocks <- map["getblocksfound"]
    }
}
