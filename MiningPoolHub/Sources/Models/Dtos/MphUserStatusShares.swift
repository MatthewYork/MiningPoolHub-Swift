//
//  MphUserStatusShares.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphUserStatusShares : Mappable {
    public var valid: Double = 0.0
    public var valid1: Double = 0.0
    public var valid2: Double = 0.0
    public var valid3: Double = 0.0
    public var valid4: Double = 0.0
    public var valid5: Double = 0.0
    public var valid6: Double = 0.0
    public var invalid: Double = 0.0
    public var id: Int = 0
    public var donate_percent: Double = 0.0
    public var is_anonymous: Bool = false
    public var username: String = ""
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        valid <- map["valid"]
        valid1 <- map["valid1"]
        valid2 <- map["valid2"]
        valid3 <- map["valid3"]
        valid4 <- map["valid4"]
        valid5 <- map["valid5"]
        valid6 <- map["valid6"]
        invalid <- map["invalid"]
        id <- map["id"]
        donate_percent <- map["donate_percent"]
        is_anonymous <- map["is_anonymous"]
        username <- map["username"]
    }
}
