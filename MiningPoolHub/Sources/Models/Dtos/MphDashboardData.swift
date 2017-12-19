//
//  MphDashboardData.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphDashboardData : Mappable {
	public var raw : MphRawDashboard = MphRawDashboard()
	public var personal: MphPersonalDashboard = MphPersonalDashboard()
	public var balance: MphDashboardBalance = MphDashboardBalance()
	public var balance_for_auto_exchange: MphDashboardBalance = MphDashboardBalance()
	public var balance_on_exchange: Int = 0
	public var recent_credits_24hours : MphCredit = MphCredit()
    public var recent_credits: [MphRecentCredit] = []
	public var pool: MphPool = MphPool()
	public var system: MphSystem = MphSystem()
	public var network: MphNetwork = MphNetwork()

    public init() {}

	// Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        raw <- map["raw"]
        personal <- map["personal"]
        balance <- map["balance"]
        balance_for_auto_exchange <- map["balance_for_auto_exchange"]
        balance_on_exchange <- map["balance_on_exchange"]
        recent_credits_24hours <- map["recent_credits_24hours"]
        recent_credits <- map["recent_credits"]
        pool <- map["pool"]
        system <- map["system"]
        network <- map["network"]
	}
}
