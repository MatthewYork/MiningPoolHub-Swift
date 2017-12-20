//
//  MphsEstimatesData.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/20/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphsEstimatesData : Mappable {
    public var last_24_hours: Double = 0.0
    public var hourly: Double = 0.0
    public var daily: Double = 0.0
    public var weekly: Double = 0.0
    public var monthly: Double = 0.0
    public var yearly: Double = 0.0
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        last_24_hours <- map["last_24_hours"]
        hourly <- map["hourly"]
        daily <- map["daily"]
        weekly <- map["weekly"]
        monthly <- map["monthly"]
        yearly <- map["yearly"]
    }
}
