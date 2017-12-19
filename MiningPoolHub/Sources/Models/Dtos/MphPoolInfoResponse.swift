//
//  MphPoolInfoResponse.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphPoolInfoResponse : Mappable {
    public var info = MphObjectData<MphPoolDetails>()
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        info <- map["getpoolinfo"]
    }
}
