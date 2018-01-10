//
//  MphsConversionData.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/20/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphsConversionData: Mappable {
    public var adz: MphsConversion = MphsConversion()
    public var aur: MphsConversion = MphsConversion()
    public var btc: MphsConversion = MphsConversion()
    public var bch: MphsConversion = MphsConversion()
    public var btg: MphsConversion = MphsConversion()
    public var dash: MphsConversion = MphsConversion()
    public var dgb: MphsConversion = MphsConversion()
    public var etn: MphsConversion = MphsConversion()
    public var eth: MphsConversion = MphsConversion()
    public var etc: MphsConversion = MphsConversion()
    public var exp: MphsConversion = MphsConversion()
    public var ftc: MphsConversion = MphsConversion()
    public var game: MphsConversion = MphsConversion()
    public var geo: MphsConversion = MphsConversion()
    public var bsty: MphsConversion = MphsConversion()
    public var grs: MphsConversion = MphsConversion()
    public var ltc: MphsConversion = MphsConversion()
    public var max: MphsConversion = MphsConversion()
    public var mona: MphsConversion = MphsConversion()
    public var xmr: MphsConversion = MphsConversion()
    public var music: MphsConversion = MphsConversion()
    public var xmy: MphsConversion = MphsConversion()
    public var sxc: MphsConversion = MphsConversion()
    public var sc: MphsConversion = MphsConversion()
    public var start: MphsConversion = MphsConversion()
    public var xvg: MphsConversion = MphsConversion()
    public var vtc: MphsConversion = MphsConversion()
    public var zec: MphsConversion = MphsConversion()
    public var zcl: MphsConversion = MphsConversion()
    public var xzc: MphsConversion = MphsConversion()
    public var zen: MphsConversion = MphsConversion()
    
    public init() {}
    
    // Mappable
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        adz <- map["ADZ"]
        aur <- map["AUR"]
        btc <- map["BTC"]
        bch <- map["BCH"]
        btg <- map["BTG"]
        dash <- map["DASH"]
        dgb <- map["DGB"]
        etn <- map["ETN"]
        eth <- map["ETH"]
        etc <- map["ETC"]
        exp <- map["EXP"]
        ftc <- map["FTC"]
        game <- map["GAME"]
        geo <- map["GEO"]
        bsty <- map["BSTY"]
        grs <- map["GRS"]
        ltc <- map["LTC"]
        max <- map["MAX"]
        mona <- map["MONA"]
        xmr <- map["XMR"]
        music <- map["MUSIC"]
        xmy <- map["XMY"]
        sxc <- map["SXC"]
        sc <- map["SC"]
        start <- map["START"]
        xvg <- map["XVG"]
        vtc <- map["VTC"]
        zec <- map["ZEC"]
        zcl <- map["ZCL"]
        xzc <- map["XZC"]
        zen <- map["ZEN"]
    }
    
    public func conversion(for domain: MphDomain) -> MphsConversion {
        switch domain {
        case .none: return btc
        case .adzcoin: return adz
        case .auroracoinQubit: return aur
        case .bitcoin: return btc
        case .bitcoinCash: return bch
        case .bitcoinGold: return btg
        case .dash: return dash
        case .digibyteGroestl: return dgb
        case .digibyteQubit: return dgb
        case .digibyteSkein: return dgb
        case .electroneum: return etn
        case .ethereum: return eth
        case .ethereumClassic: return etc
        case .expanse: return exp
        case .feathercoin: return ftc
        case .gamecredits: return game
        case . geocoin: return geo
        case .globalboosty: return bsty
        case .groestlcoin: return grs
        case .litecoin: return ltc
        case .maxcoin: return max
        case .monacoin: return mona
        case .monero: return xmr
        case .musicoin: return music
        case .myriadcoinGroestl: return xmy
        case .myriadcoinSkein: return xmy
        case .myriadcoinYescrypt: return xmy
        case .sexcoin: return sxc
        case .siacoin: return sc
        case .startcoin: return start
        case .vergeScrypt: return xvg
        case .vertcoin: return vtc
        case .zcash: return zec
        case .zclassic: return zcl
        case .zcoin: return xzc
        case .zencash: return zen
        }
    }
}


