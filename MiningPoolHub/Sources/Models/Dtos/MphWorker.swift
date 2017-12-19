//
//  MphWorker.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphWorker : Mappable {
    public var id: Int = 0
    public var username: String = ""
    public var password: String = ""
    public var monitor: Double = 0.0
    public var hashrate: Double = 0.0
    public var difficulty: Double = 0.0
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
        password <- map["password"]
        monitor <- map["monitor"]
        hashrate <- map["hashrate"]
        difficulty <- map["difficulty"]
    }
}
