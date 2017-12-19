//
//  MphTopContributorsResponse.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphTopContributorsResponse : Mappable {
    public var contributor = MphObjectData<MphTopContributor>()
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        contributor <- map["gettopcontributors"]
    }
}
