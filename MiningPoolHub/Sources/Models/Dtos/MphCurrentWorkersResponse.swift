//
//  MphCurrentWorkersResponse.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphCurrentWorkersResponse : Mappable {
    public var workers: MphIntegerData = MphIntegerData()
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        workers <- map["getcurrentworkers"]
    }
}
