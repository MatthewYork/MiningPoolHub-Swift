//
//  MphCoinProfitStatistics.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/18/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphCoinProfitStatistics : Mappable {
	public var coin_name: String = ""
	public var host: String = ""
	public var host_list: String = ""
	public var port: Int = 0
	public var direct_mining_host: String = ""
	public var direct_mining_host_list: String = ""
	public var direct_mining_algo_port: Int = 0
	public var algo: String = ""
	public var normalized_profit: Double = 0.0
	public var normalized_profit_amd: Double = 0.0
	public var normalized_profit_nvidia: Double = 0.0
	public var profit: Double = 0.0
	public var pool_hash: String = ""
	public var net_hash: String = ""
	public var difficulty: Double = 0.0
	public var reward: Int = 0
	public var last_block: Int = 0
	public var time_since_last_block: Int = 0
	public var time_since_last_block_in_words: String = ""
	public var bittrex_buy_price: Double = 0.0
	public var cryptsy_buy_price: Double = 0
	public var yobit_buy_price: Double = 0
	public var poloniex_buy_price: Double = 0
	public var highest_buy_price: Double = 0.0

    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {

		coin_name <- map["coin_name"]
		host <- map["host"]
		host_list <- map["host_list"]
		port <- map["port"]
		direct_mining_host <- map["direct_mining_host"]
		direct_mining_host_list <- map["direct_mining_host_list"]
		direct_mining_algo_port <- map["direct_mining_algo_port"]
		algo <- map["algo"]
		normalized_profit <- map["normalized_profit"]
		normalized_profit_amd <- map["normalized_profit_amd"]
		normalized_profit_nvidia <- map["normalized_profit_nvidia"]
		profit <- map["profit"]
		pool_hash <- map["pool_hash"]
		net_hash <- map["net_hash"]
		difficulty <- map["difficulty"]
		reward <- map["reward"]
		last_block <- map["last_block"]
		time_since_last_block <- map["time_since_last_block"]
		time_since_last_block_in_words <- map["time_since_last_block_in_words"]
		bittrex_buy_price <- map["bittrex_buy_price"]
		cryptsy_buy_price <- map["cryptsy_buy_price"]
		yobit_buy_price <- map["yobit_buy_price"]
		poloniex_buy_price <- map["poloniex_buy_price"]
		highest_buy_price <- map["highest_buy_price"]
    }
}
