//
//  MphTopContributorHashes.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphTopContributorHashes : Mappable {
    public var account: String = ""
    public var hashrate: Double = 0.0
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        account <- map["account"]
        hashrate <- map["hashrate"]
    }
}
