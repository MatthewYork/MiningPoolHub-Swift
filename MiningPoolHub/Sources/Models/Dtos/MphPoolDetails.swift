//
//  MphPoolDetails.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphPoolDetails : Mappable {
    public var currency: String = ""
    public var coinname: String = ""
    public var cointarget: String = ""
    public var coinDiffChangeTarget: Int = 0
    public var algorithm: String = ""
    public var stratumport: String = ""
    public var payout_system: String = ""
    public var confirmations: Int = 0
    public var min_ap_threshold: Double = 0.0
    public var max_ap_threshold: Double = 0.0
    public var reward_type: String = ""
    public var reward: Double = 0.0
    public var txfee: Double = 0.0
    public var txfee_manual: Double = 0.0
    public var txfee_auto: Double = 0.0
    public var fees: Double = 0.0
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        currency <- map["currency"]
        coinname <- map["coinname"]
        cointarget <- map["cointarget"]
        coinDiffChangeTarget <- map["coindiffchangetarget"]
        algorithm <- map["algorithm"]
        stratumport <- map["stratumport"]
        payout_system <- map["payout_system"]
        confirmations <- map["confirmations"]
        min_ap_threshold <- map["min_ap_threshold"]
        max_ap_threshold <- map["max_ap_threshold"]
        reward_type <- map["reward_type"]
        reward <- map["reward"]
        txfee <- map["txfee"]
        txfee_manual <- map["txfee_manual"]
        txfee_auto <- map["txfee_auto"]
        fees <- map["fees"]
    }
}

