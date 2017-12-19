//
//  MphBlockStatistic.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphBlockStat : Mappable {
    public var total: Int = 0
    public var totalValid: String = ""
    public var totalOrphan: String = ""
    public var totalDifficulty: Int = 0
    public var totalShares: String = ""
    public var totalEstimatedShares: Int = 0
    public var totalAmount: Int = 0
    
    public var oneHourTotal: String = ""
    public var oneHourValid: String = ""
    public var oneHourOrphan: String = ""
    public var oneHourDifficulty: Int = 0
    public var oneHourShares: String = ""
    public var oneHourEstimatedShares: Int = 0
    public var oneHourAmount: Int = 0
    
    public var twentyFourHourTotal: String = ""
    public var twentyFourHourValid: String = ""
    public var twentyFourHourOrphan: String = ""
    public var twentyFourHourDifficulty: Int = 0
    public var twentyFourHourShares: String = ""
    public var twentyFourHourEstimatedShares: Int = 0
    public var twentyFourHourAmount: Int = 0
    
    public var sevenDayTotal: String = ""
    public var sevenDayValid: String = ""
    public var sevenDayOrphan: String = ""
    public var sevenDayDifficulty: Int = 0
    public var sevenDayShares: String = ""
    public var sevenDayEstimatedShares: Int = 0
    public var sevenDayAmount: Int = 0
    
    public var fourWeekTotal: String = ""
    public var fourWeekValid: String = ""
    public var fourWeekOrphan: String = ""
    public var fourWeekDifficulty: Int = 0
    public var fourWeekShares: String = ""
    public var fourWeekEstimatedShares: Int = 0
    public var fourWeekAmount: Int = 0
    
    public var twelveMonthTotal: String = ""
    public var twelveMonthValid: String = ""
    public var twelveMonthOrphan: String = ""
    public var twelveMonthDifficulty: Int = 0
    public var twelveMonthShares: String = ""
    public var twelveMonthEstimatedShares: Int = 0
    public var twelveMonthAmount: Int = 0
    
    init() { }
    
    // Mappable
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        total <- map["Total"]
        totalValid <- map["TotalValid"]
        totalOrphan <- map["TotalOrphan"]
        totalDifficulty <- map["TotalDifficulty"]
        totalShares <- map["TotalShares"]
        totalEstimatedShares <- map["TotalEstimatedShares"]
        totalAmount <- map["TotalAmount"]
        
        oneHourTotal <- map["1HourTotal"]
        oneHourValid <- map["1HourValid"]
        oneHourOrphan <- map["1HourOrphan"]
        oneHourDifficulty <- map["1HourDifficulty"]
        oneHourShares <- map["1HourShares"]
        oneHourEstimatedShares <- map["1HourEstimatedShares"]
        oneHourAmount <- map["1HourAmount"]
        
        twentyFourHourTotal <- map["24HourTotal"]
        twentyFourHourValid <- map["24HourValid"]
        twentyFourHourOrphan <- map["24HourOrphan"]
        twentyFourHourDifficulty <- map["24HourDifficulty"]
        twentyFourHourShares <- map["24HourShares"]
        twentyFourHourEstimatedShares <- map["24HourEstimatedShares"]
        twentyFourHourAmount <- map["24HourAmount"]
        
        sevenDayTotal <- map["7DaysTotal"]
        sevenDayValid <- map["7DaysValid"]
        sevenDayOrphan <- map["7DaysOrphan"]
        sevenDayDifficulty <- map["7DaysDifficulty"]
        sevenDayShares <- map["7DaysShares"]
        sevenDayEstimatedShares <- map["7DaysEstimatedShares"]
        sevenDayAmount <- map["7DaysAmount"]
        
        fourWeekTotal <- map["4WeeksTotal"]
        fourWeekValid <- map["4WeeksValid"]
        fourWeekOrphan <- map["4WeeksOrphan"]
        fourWeekDifficulty <- map["4WeeksDifficulty"]
        fourWeekShares <- map["4WeeksShares"]
        fourWeekEstimatedShares <- map["4WeeksEstimatedShares"]
        fourWeekAmount <- map["4WeeksAmount"]
        
        twelveMonthTotal <- map["12MonthTotal"]
        twelveMonthValid <- map["12MonthValid"]
        twelveMonthOrphan <- map["12MonthOrphan"]
        twelveMonthDifficulty <- map["12MonthDifficulty"]
        twelveMonthShares <- map["12MonthShares"]
        twelveMonthEstimatedShares <- map["12MonthEstimatedShares"]
        twelveMonthAmount <- map["12MonthAmount"]
    }
}
