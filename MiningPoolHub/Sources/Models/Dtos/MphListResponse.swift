//
//  MphListResponse.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/18/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphListResponse<T:Mappable> : Mappable {
	public var success : Bool = false
	public var response : [T] = []


    // Mappable
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
		success <- map["success"]
        response <- map["return"]
	}
}
