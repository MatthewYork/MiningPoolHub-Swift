//
//  MphWebProvider.swift
//  MiningPoolHub
//
//  Created by Matthew York on 12/18/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public enum HttpMethod: String {
    case get = "GET",
    post = "POST",
    put = "PUT",
    delete = "DELETE"
}

public enum MphDomain: Int {
    case none,
    adzcoin,
    auroracoinQubit,
    bitcoin,
    bitcoinCash,
    bitcoinGold,
    dash,
    digibyteGroestl,
    digibyteQubit,
    digibyteSkein,
    electroneum,
    ethereum,
    ethereumClassic,
    expanse,
    feathercoin,
    gamecredits,
    geocoin,
    globalboosty,
    groestlcoin,
    litecoin,
    maxcoin,
    monacoin,
    monero,
    musicoin,
    myriadcoinGroestl,
    myriadcoinSkein,
    myriadcoinYescrypt,
    sexcoin,
    siacoin,
    startcoin,
    vergeScrypt,
    vertcoin,
    zcash,
    zclassic,
    zcoin,
    zencash
    
    public func description() -> String {
        switch self {
            case .none: return ""
            case .adzcoin: return "adzcoin"
            case .auroracoinQubit: return "auroracoin-qubit"
            case .bitcoin: return "bitcoin"
            case .bitcoinCash: return "bitcoin-cash"
            case .bitcoinGold: return "bitcoin-gold"
            case .dash: return "dash"
            case .digibyteGroestl: return "digibyte-groestl"
            case .digibyteQubit: return "digibyte-qubit"
            case .digibyteSkein: return "digibyte-skein"
            case .electroneum: return "electroneum"
            case .ethereum: return "ethereum"
            case .ethereumClassic: return "ethereum-classic"
            case .expanse: return "expanse"
            case .feathercoin: return "feathercoin"
            case .gamecredits: return "gamecredits"
            case . geocoin: return "geocoin"
            case .globalboosty: return "globalboosty"
            case .groestlcoin: return "groestlcoin"
            case .litecoin: return "litecoin"
            case .maxcoin: return "maxcoin"
            case .monacoin: return "monacoin"
            case .monero: return "monero"
            case .musicoin: return "musicoin"
            case .myriadcoinGroestl: return "myriadcoin-groestl"
            case .myriadcoinSkein: return "myriadcoin-skein"
            case .myriadcoinYescrypt: return "myriadcoin-yescrypt"
            case .sexcoin: return "sexcoin"
            case .siacoin: return "siacoin"
            case .startcoin: return "startcoin"
            case .vergeScrypt: return "verge-scrypt"
            case .vertcoin: return "vertcoin"
            case .zcash: return "zcash"
            case .zclassic: return "zclassic"
            case .zcoin: return "zcoin"
            case .zencash: return "zencash"
        }
    }
    
    public init?(string: String) {
        switch string {
        case "":
            self = .none
        case "adzcoin" :
            self = .adzcoin
        case "auroracoin-qubit":
            self = .auroracoinQubit
        case "bitcoin":
            self = .bitcoin
        case "bitcoin-cash":
            self = .bitcoinCash
        case "bitcoin-gold":
            self = .bitcoinGold
        case "dash":
            self = .dash
        case "digibyte-groestl":
            self = .digibyteGroestl
        case "digibyte-qubit":
            self = .digibyteQubit
        case "digibyte-skein":
            self = .digibyteSkein
        case "electroneum":
            self = .electroneum
        case "ethereum":
            self = .ethereum
        case "ethereum-classic":
            self = .ethereumClassic
        case "expanse":
            self = .expanse
        case "feathercoin":
            self = .feathercoin
        case "gamecredits":
            self = .gamecredits
        case "geocoin":
            self = .geocoin
        case "globalboosty":
            self = .globalboosty
        case "groestlcoin":
            self = .groestlcoin
        case "litecoin":
            self = .litecoin
        case "maxcoin":
            self = .maxcoin
        case "monacoin":
            self = .monacoin
        case "monero":
            self = .monero
        case "musicoin":
            self = .musicoin
        case "myriadcoin-groestl":
            self = .myriadcoinGroestl
        case "myriadcoin-skein":
            self = .myriadcoinSkein
        case "myriadcoin-yescrypt":
            self = .myriadcoinYescrypt
        case "sexcoin":
            self = .sexcoin
        case "siacoin":
            self = .siacoin
        case "startcoin":
            self = .startcoin
        case "verge-scrypt":
            self = .vergeScrypt
        case "vertcoin":
            self = .vertcoin
        case "zcash":
            self = .zcash
        case "zclassic":
            self = .zclassic
        case "zcoin":
            self = .zcoin
        case "zencash":
            self = .zencash
        default: return nil
        }
    }
}

public enum MphsCurrency: Int {
    case usd, eur, gbp, cad, btc, ltc, eth, xmr
    
    public func description() -> String {
        switch self {
        case .usd: return "USD"
        case .eur: return "EUR"
        case .gbp: return "GBP"
        case .cad: return "CAD"
        case .btc: return "BTC"
        case .ltc: return "LTC"
        case .eth: return "ETH"
        case .xmr: return "XMR"
        }
    }
    
    public init?(string: String) {
        switch string {
        case "USD":
            self = .usd
        case "EUR" :
            self = .eur
        case "GBP":
            self = .gbp
        case "CAD":
            self = .cad
        case "BTC":
            self = .btc
        case "LTC":
            self = .ltc
        case "ETH":
            self = .eth
        case "XMR":
            self = .xmr
        default: return nil
        }
    }
}

public class MphWebProvider {

    var operationQueue = OperationQueue()
    let urlSession: URLSession = URLSession(configuration:URLSessionConfiguration.default)
    let baseAddress: String = "miningpoolhub.com/index.php?page=api&"
    var configuration: MphConfiguration
    public var mphDomain: MphDomain = MphDomain.none
    var customDomain: String?
    
    //MARK: - Init
    public init(configuration: MphConfiguration) {
        self.configuration = configuration
    }
    
    //MARK: - Domains
    public func set(domain: MphDomain) {
        self.mphDomain = domain
        customDomain = nil
    }
    public func setCustom(domain: String) {
        customDomain = domain
    }
    
    //MARK: - Token Management
    public func set(apiKey: String) {
        configuration.apiKey = apiKey
    }
}

//MARK: - Api
extension MphWebProvider : MphProvider {
    //MARK: - Unauthenticated
    
    /**
     Get mining profits statistics
     */
    public func getMiningAndProfitsStatistics(completion: @escaping (MphListResponse<MphCoinProfitStatistics>) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getminingandprofitsstatistics", completion: completion, error: error)
    }
    
    /**
     Get current auto switching info
     */
    public func getAutoSwitchingAndProfitsStatistics(completion: @escaping (MphListResponse<MphAutoSwitchingProfitStatistics>) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getautoswitchingandprofitsstatistics", completion: completion, error: error)
    }
    
    /**
     Fetch public pool statistics, no authentication required
    */
    public func getPublicPoolStatistics(completion: @escaping (MphPublicPoolResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=public", completion: completion, error: error)
    }
    
    //MARK: - Authenticated
    
    /**
     Get all currency's balances
    */
    public func getUserAllBalances(completion: @escaping (MphUserBalancesResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getuserallbalances", completion: completion, error: error)
    }
    
    /**
     Get current block height in blockchain
     */
    public func getBlockCount(completion: @escaping (MphBlockCountResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getblockcount", completion: completion, error: error)
    }
    
    /**
     Get last N blocks found as configured in admin panel
    */
    public func getBlocksFound(completion: @escaping (MphBlocksFoundResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getblocksfound", completion: completion, error: error)
    }
    
    /**
     Get pool block stats
     */
    public func getBlockStats(completion: @escaping (MphBlockStatsResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getblockstats", completion: completion, error: error)
    }
    
    /**
     Get amount of current active workers
     */
    public func getCurrentWorkers(completion: @escaping (MphCurrentWorkersResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getcurrentworkers", completion: completion, error: error)
    }
    
    /**
     Fetch all dashboard related information
     */
    public func getDashboardData(id: String? = nil, completion: @escaping (MphDashboardResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        //Build action
        var action = "action=getdashboarddata"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }
    
    /**
     Get current difficulty in blockchain
     */
    public func getDifficulty(completion: @escaping (MphDifficultyResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getdifficulty", completion: completion, error: error)
    }
    
    /**
     Get estimated time to next block based on pool hashrate (seconds)
     */
    public func getEstimatedTime(completion: @escaping (MphEstimatedTimeResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getestimatedtime", completion: completion, error: error)
    }
    
    /**
     Get current pool hashrate
     */
    public func getPoolHashRate(completion: @escaping (MphPoolHashRateResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getpoolhashrate", completion: completion, error: error)
    }
    
    /**
     Get the information on pool settings
    */
    public func getPoolInfo(completion: @escaping (MphPoolInfoResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getpoolinfo", completion: completion, error: error)
    }
    
    /**
     Get current pool share rate (shares/s)
     */
    public func getPoolShareRate(completion: @escaping (MphPoolShareRateResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getpoolsharerate", completion: completion, error: error)
    }
    
    /**
     Fetch overall pool status, only user token is required
    */
    public func getPoolStatus(completion: @escaping (MphPoolStatusResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getpoolstatus", completion: completion, error: error)
    }
    
    /**
     Get time since last block found (seconds)
    */
    public func getTimeSinceLastBlock(completion: @escaping (MphTimeSinceLastBlockResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=gettimesincelastblock", completion: completion, error: error)
    }
    
    /**
     Fetch top contributors data
    */
    public func getTopContributors(completion: @escaping (MphTopContributorsResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=gettopcontributors", completion: completion, error: error)
    }
    
    /**
     Fetch a users balance
    */
    public func getUserBalance(id: String? = nil, completion: @escaping (MphUserBalanceResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        var action = "action=getuserbalance"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }
    
    /**
     Fetch a users hash rate
     */
    public func getUserHashRate(id: String?, completion: @escaping (MphUserHashRateResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        var action = "action=getuserhashrate"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }

    /**
     Fetch a users share rate
    */
    public func getUserShareRate(id: String?, completion: @escaping (MphUserShareRateResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        var action = "action=getusersharerate"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }
    
    /**
     Fetch a users overall status
     */
    public func getUserStatus(id: String?, completion: @escaping (MphUserStatusResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        var action = "action=getuserstatus"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }
    
    /**
     Get a users transactions
     */
    public func getUserTransactions(id: String?, completion: @escaping (MphUserTransactionsResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        var action = "action=getusertransactions"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }
    
    /**
     Fetch a users worker status
     */
    public func getUserWorkers(id: String?, completion: @escaping (MphUserWorkersResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        var action = "action=getuserworkers"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }
    
    //MARK: - Mining Pool Hub Stats
    
    /**
     Fetches aggregate statistics from miningpoolhubstats.com
     */
    public func getMiningPoolHubStats(currency: MphsCurrency, completion: @escaping (MphsResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        //Build Url
        let url = "https://miningpoolhubstats.com/api/"+currency.description()+"/"+configuration.apiKey
        var request = URLRequest(url: URL(string:url)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20.0)
        
        //Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //Set body
        request.httpBody = nil
        request.httpMethod = "GET"
        
        //Make request
        let task = urlSession.dataTask(with: request) {(data, response, taskError)  -> Void in
            
            //Clean the response to be traditional http response
            let httpResponse = self.cleanResponse(urlResponse: response)
            if !httpResponse.wasSuccessful { DispatchQueue.main.async { error(WebProviderError(error: taskError)) } }
            guard let responseString = String(data: data!, encoding: String.Encoding.utf8) else { error(WebProviderError(error: nil)); return }
            
            //Parse and return
            guard let mappedObject = Mapper<MphsResponse>().map(JSONString: responseString) else {
                let parseError = MapError(key: "", currentValue: "", reason: "Error parsing response object: \(MphsResponse.self)")
                DispatchQueue.main.async { error(parseError) }
                return
            }
            DispatchQueue.main.async { completion(mappedObject) }
        }
        task.resume()
        return task
    }
}

// Url Request
extension MphWebProvider {
    fileprivate func makeJsonRequest<RT:Mappable>(method: HttpMethod, action: String, headers: [String:String] = [:], completion:@escaping (RT) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        
        //Build Url
        let url = requestUrl(for: action)
        var request = URLRequest(url: URL(string:url)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20.0)
        
        //Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        for header in headers { request.addValue(header.value, forHTTPHeaderField: header.key) }
        
        //Set body
        request.httpBody = nil
        request.httpMethod = method.rawValue
        
        //Make request
        let task = urlSession.dataTask(with: request) {(data, response, taskError)  -> Void in
            
            //Clean the response to be traditional http response
            let httpResponse = self.cleanResponse(urlResponse: response)
            if !httpResponse.wasSuccessful { DispatchQueue.main.async { error(WebProviderError(error: taskError)) } }
            guard let data = data , let responseString = String(data: data, encoding: String.Encoding.utf8) else { error(WebProviderError(error: nil)); return }
            
            //Parse and return
            guard let mappedObject = Mapper<RT>().map(JSONString: responseString) else {
                let parseError = MapError(key: "", currentValue: "", reason: "Error parsing response object: \(RT.self)")
                DispatchQueue.main.async { error(parseError) }
                return
            }
            DispatchQueue.main.async { completion(mappedObject) }
        }
        task.resume()
        
        return task
    }
    
    fileprivate func makeRequest() -> MphProviderOperationProtocol {
        return URLSessionTask()
    }
    
    fileprivate func requestUrl(for action: String) -> String {
        let domain = (customDomain ?? mphDomain.description())
        let domainPrefix = domain != "" ? domain+"." : domain
        return "https://\(domainPrefix)\(baseAddress)\(action)"+"&api_key="+configuration.apiKey
    }
}

extension MphWebProvider {
    fileprivate func cleanResponse(urlResponse: URLResponse?) -> HTTPURLResponse {
        if urlResponse != nil {
            return (urlResponse! as! HTTPURLResponse)
        }
        else {
            let httpResponse = HTTPURLResponse(url: URL(string:"com.webprovider")!, statusCode: 500, httpVersion: "", headerFields: [:])
            return httpResponse!
        }
    }
}

extension HTTPURLResponse {
    var wasSuccessful: Bool { return (self.statusCode >= 200 && self.statusCode < 300) }
}

public class WebProviderError: Error {
    init() { }
    init(error: Error?) { }
}
