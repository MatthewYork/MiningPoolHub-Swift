//
//  MphAlgorithmProfitStatistics.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/18/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphAutoSwitchingProfitStatistics: Mappable {
    public var algo: String = ""
    public var current_mining_coin: String = ""
    public var host: String = ""
    public var all_host_list: String = ""
    public var port: Int = 0
    public var algo_switch_port: Int = 0
    public var multialgo_switch_port: Int = 0
    public var profit: Double = 0
    public var normalized_profit_amd: Double = 0
    public var normalized_profit_nvidia: Double = 0
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        
        algo <- map["algo"]
        current_mining_coin <- map["current_mining_coin"]
        host <- map["host"]
        all_host_list <- map["all_host_list"]
        port <- map["port"]
        algo_switch_port <- map["algo_switch_port"]
        multialgo_switch_port <- map["multialgo_switch_port"]
        profit <- map["profit"]
        normalized_profit_amd <- map["normalized_profit_amd"]
        normalized_profit_nvidia <- map["normalized_profit_nvidia"]
    }
}



