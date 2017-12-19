//
//  MphVersionRuntimeResponse.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/18/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphVersionRuntimeResponse : Mappable {
    public var version: String = ""
    public var runtime: Double = 0.0
    
    init() { }
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        version <- map["version"]
        runtime <- map["runtime"]
    }
}
