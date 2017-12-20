//
//  MphsConversion.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/20/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphsConversion : Mappable {
    //fiat
    public var usd: Double?
    public var eur: Double?
    public var gbp: Double?
    
    //crypto
    public var btc: Double?
    public var ltc: Double?
    public var eth: Double?
    public var xmr: Double?
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        usd <- map["USD"]
        eur <- map["EUR"]
        gbp <- map["GBP"]
        
        btc <- map["BTC"]
        ltc <- map["LTC"]
        eth <- map["ETH"]
        xmr <- map["XMR"]
    }
}
