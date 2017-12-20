//
//  MphsTotalsData.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/20/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphsTotalsData : Mappable {
    public var confirmed_value: Double = 0.0
    public var unconfirmed_value: Double = 0
    public var on_exchange_value: Double = 0.0
    public var total_value: Double = 0.0
    public var payout_last_24_value: Double = 0.0
    public var hourly_estimate_value: Double = 0.0
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        confirmed_value <- map["confirmed_value"]
        unconfirmed_value <- map["unconfirmed_value"]
        on_exchange_value <- map["on_exchange_value"]
        total_value <- map["total_value"]
        payout_last_24_value <- map["payout_last_24_value"]
        hourly_estimate_value <- map["hourly_estimate_value"]
    }
}
