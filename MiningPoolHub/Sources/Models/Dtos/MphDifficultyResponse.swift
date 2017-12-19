//
//  MphDifficultyResponse.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphDifficultyResponse : Mappable {
    public var difficulty: MphIntegerData = MphIntegerData()
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        difficulty <- map["getdifficulty"]
    }
}
