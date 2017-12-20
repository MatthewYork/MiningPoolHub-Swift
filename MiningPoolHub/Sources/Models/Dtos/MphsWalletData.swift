//
//  MphsWalletData.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/20/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphsWalletData: Mappable {
    public var coin: String = ""
    public var confirmed: Double = 0.0
    public var unconfirmed: Int = 0
    public var on_exchange: Int = 0
    public var total: Double = 0.0
    public var payout_last_24: Double = 0.0
    public var hourly_estimate: Int = 0
    public var hashrate: Int = 0
    public var code: String = ""
    public var confirmed_value: Double = 0.0
    public var unconfirmed_value: Int = 0
    public var on_exchange_value: Int = 0
    public var total_value: Double = 0.0
    public var payout_last_24_value: Double = 0.0
    public var hourly_estimate_value: Int = 0
    public var is_autoconvert: Int = 0
    public var is_payout_coin: Int = 0
    public var min_payout: Double = 0.0
    public var payout_fee: Double = 0.0
    public var payout_percent: Int = 0
    public var payout_fee_percent: Int = 0
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) {
        coin <- map["coin"]
        confirmed <- map["confirmed"]
        unconfirmed <- map["unconfirmed"]
        on_exchange <- map["on_exchange"]
        total <- map["total"]
        payout_last_24 <- map["payout_last_24"]
        hourly_estimate <- map["hourly_estimate"]
        hashrate <- map["hashrate"]
        code <- map["code"]
        confirmed_value <- map["confirmed_value"]
        unconfirmed_value <- map["unconfirmed_value"]
        on_exchange_value <- map["on_exchange_value"]
        total_value <- map["total_value"]
        payout_last_24_value <- map["payout_last_24_value"]
        hourly_estimate_value <- map["hourly_estimate_value"]
        is_autoconvert <- map["is_autoconvert"]
        is_payout_coin <- map["is_payout_coin"]
        min_payout <- map["min_payout"]
        payout_fee <- map["payout_fee"]
        payout_percent <- map["payout_percent"]
        payout_fee_percent <- map["payout_fee_percent"]
    }
    
    public func mapping(map: Map) {
        //rate <- map["getuserstatus"]
    }
}
