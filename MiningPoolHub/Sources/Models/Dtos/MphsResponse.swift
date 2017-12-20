//
//  MphsResponse.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/20/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphsResponse : Mappable {
    public var cached_time: String?
    public var autoconvert_currency: String?
    public var currency: String = ""
    public var conversion_data: MphsConversionData = MphsConversionData()
    public var wallet_data: [MphsWalletData] = []
    public var worker_data: [MphsWorkerData] = []
    public var decimal_data: Double = 0.0
    public var totals_data: MphsTotalsData = MphsTotalsData()
    public var estimates_data: MphsEstimatesData = MphsEstimatesData()
    public var thresholds: MphsThresholds = MphsThresholds()
    public var api_key: String = ""
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        cached_time <- map["cached_time"]
        autoconvert_currency <- map["autoconvert_currency"]
        currency <- map["currency"]
        conversion_data <- map["conversion_data"]
        wallet_data <- map["wallet_data"]
        worker_data <- map["worker_data"]
        decimal_data <- map["decimal_data"]
        totals_data <- map["totals_data"]
        estimates_data <- map["estimates_data"]
        thresholds <- map["thresholds"]
        api_key <- map["api_key"]
    }
}
