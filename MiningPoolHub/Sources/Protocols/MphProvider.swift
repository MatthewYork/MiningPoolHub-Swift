//
//  MphProviderProtocol.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/18/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation

public protocol MphProvider {
    //No Api Key Required
    func getMiningAndProfitsStatistics(completion: @escaping (MphListResponse<MphCoinProfitStatistics>) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getAutoSwitchingAndProfitsStatistics(completion: @escaping (MphListResponse<MphAutoSwitchingProfitStatistics>) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    
    //Api Key Required
    func getUserAllBalances(completion: @escaping (MphUserBalancesResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getBlockCount(completion: @escaping (MphBlockCountResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
}


