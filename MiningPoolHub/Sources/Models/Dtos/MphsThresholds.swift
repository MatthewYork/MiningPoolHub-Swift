//
//  MphsThresholds.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/20/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphsThresholds : Mappable {
    public var green: Int = 0
    public var orange: Int = 0
    public var red: Int = 0
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        green <- map["green"]
        orange <- map["orange"]
        red <- map["red"]
    }
}
