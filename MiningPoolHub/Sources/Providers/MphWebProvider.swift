//
//  WebProviderProtocol.swift
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

public enum MphDomain: String {
    case root = "",
    adzcoin = "adzcoin",
    auroracoinQubit = "auroracoin-qubit",
    bitcoin = "bitcoin",
    bitcoinCash = "bitcoin-cash",
    bitcoinGold = "bitcoin-gold",
    dash = "dash",
    digibyteGroestl = "digibyte-groestl",
    digibyteQubit = "digibyte-qubit",
    digibyteSkein = "digibyte-skein",
    electroneum = "electroneum",
    ethereum = "ethereum",
    ethereumClassic = "ethereum-classic",
    expanse = "expanse",
    feathercoin = "feathercoin",
    gamecredits = "gamecredits",
    geocoin = "geocoin",
    globalboosty = "globalboosty",
    groestlcoin = "groestlcoin",
    litecoin = "litecoin",
    maxcoin = "maxcoin",
    monacoin = "monacoin",
    monero = "monero",
    musicoin = "musicoin",
    myriadcoinGroestl = "myriadcoin-groestl",
    myriadcoinSkein = "myriadcoin-skein",
    myriadcoinYescrypt = "myriadcoin-yescrypt",
    sexcoin = "sexcoin",
    siacoin = "siacoin",
    startcoin = "startcoin",
    vergeScrypt = "verge-scrypt",
    vertcoin = "vertcoin",
    zcash = "zcash",
    zclassic = "zclassic",
    zcoin = "zcoin",
    zencash = "zencash"

}

public class MphWebProvider {

    var operationQueue = OperationQueue()
    let urlSession: URLSession = URLSession(configuration:URLSessionConfiguration.default)
    let baseAddress: String = "miningpoolhub.com/index.php?page=api&"
    let configuration: MphConfiguration
    var mphDomain: MphDomain = MphDomain.root
    var customDomain: String?
    
    //MARK: - Init
    init(configuration: MphConfiguration) {
        self.configuration = configuration
    }
    
    //MARK: - Domains
    func set(domain: MphDomain) {
        self.mphDomain = domain
        customDomain = nil
    }
    func setCustom(domain: String) {
        customDomain = domain
    }
}

//MARK: - Api
extension MphWebProvider : MphProvider {
    public func getMiningAndProfitsStatistics(completion: @escaping (MphListResponse<MphCoinProfitStatistics>) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getminingandprofitsstatistics", completion: completion, error: error)
    }
    
    public func getAutoSwitchingAndProfitsStatistics(completion: @escaping (MphListResponse<MphAutoSwitchingProfitStatistics>) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getautoswitchingandprofitsstatistics", completion: completion, error: error)
    }
    
    public func getUserAllBalances(completion: @escaping (MphUserBalancesResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getuserallbalances", completion: completion, error: error)
    }
    
    public func getBlockCount(completion: @escaping (MphBlockCountResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getblockcount", completion: completion, error: error)
    }
    
    public func getBlocksFound(completion: @escaping (MphBlocksFoundResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getblocksfound", completion: completion, error: error)
    }
    
    public func getBlockStats(completion: @escaping (MphBlockStatsResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getblockstats", completion: completion, error: error)
    }
    
    public func getCurrentWorkers(completion: @escaping (MphCurrentWorkersResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getcurrentworkers", completion: completion, error: error)
    }
    
    public func getDashboardData(id: String? = nil, completion: @escaping (MphDashboardResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        //Build action
        var action = "action=getdashboarddata"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }
    
    public func getDifficulty(completion: @escaping (MphDifficultyResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getdifficulty", completion: completion, error: error)
    }
    
    public func getEstimatedTime(completion: @escaping (MphEstimatedTimeResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getestimatedtime", completion: completion, error: error)
    }
    
    public func getPoolHashRate(completion: @escaping (MphPoolHashRateResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getpoolhashrate", completion: completion, error: error)
    }
    
    public func getPoolInfo(completion: @escaping (MphPoolInfoResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getpoolinfo", completion: completion, error: error)
    }
    
    // MARK: - Access
//    public func login(loginRequest: LoginRequest, completion: @escaping (LoginResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
//        return makeJsonRequest(method: .post, action: "/api/access/login", body: loginRequest, completion: completion, error: error)
//    }
    
    
}

// Url Request
extension MphWebProvider {
    fileprivate func makeJsonArrayRequest<RT:Mappable>(method: HttpMethod, action: String, headers: [String:String] = [:], completion:@escaping ([RT]) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        
        let url = requestUrl(for: action)
        var request = URLRequest(url: URL(string:url)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20.0)
        
        //Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        //Add body data
        // Create JSON String from Model
        //let JSONString = Mapper().toJSONString(user, prettyPrint: true)
        request.httpBody = nil
        request.httpMethod = method.rawValue
        
        let task = urlSession.dataTask(with: request) {(data, response, taskError)  -> Void in
            
            //Clean the response to be traditional http response
            let httpResponse = self.cleanResponse(urlResponse: response)
            
            if httpResponse.wasSuccessful {
                let responseString = String(data: data!, encoding: String.Encoding.utf8)!
                if let mappedObject = Mapper<RT>().mapArray(JSONString: responseString) {
                    DispatchQueue.main.async {
                        completion(mappedObject)
                    }
                }
                else {
                    let parseError = MapError(key: "", currentValue: "", reason: "Error parsing response object: \(RT.self)")
                    DispatchQueue.main.async {
                        error(parseError)
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    error(WebProviderError(error: taskError))
                }
            }
        }
        task.resume()
        
        return task
    }
    fileprivate func makeJsonArrayRequest<T:Mappable,RT:Mappable>(method: HttpMethod, action: String, headers: [String:String] = [:], body: T?, completion:@escaping ([RT]) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        
        let url = requestUrl(for: action)
        var request = URLRequest(url: URL(string:url)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20.0)
        
        //Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        //Add body data
        // Create JSON String from Model
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body!.toJSON(), options: [])
            //print(String(data: jsonData, encoding: String.Encoding.utf8)!)
            request.httpBody = jsonData
        } catch {
            
        }
        //let JSONString = Mapper().toJSONString(user, prettyPrint: true)
        request.httpMethod = method.rawValue
        
        let task = urlSession.dataTask(with: request) {(data, response, taskError)  -> Void in
            
            //Clean the response to be traditional http response
            let httpResponse = self.cleanResponse(urlResponse: response)
            //let responseString = String(data: data!, encoding: String.Encoding.utf8)!
            if httpResponse.wasSuccessful {
                let responseString = String(data: data!, encoding: String.Encoding.utf8)!
                //print(responseString)
                
                if let mappedObject = Mapper<RT>().mapArray(JSONString: responseString) {
                    DispatchQueue.main.async {
                        completion(mappedObject)
                    }
                }
                else {
                    let parseError = MapError(key: "", currentValue: "", reason: "Error parsing response object: \(RT.self)")
                    DispatchQueue.main.async {
                        error(parseError)
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    //print(taskError?.localizedDescription)
                    error(WebProviderError(error: taskError))
                }
            }
        }
        task.resume()
        
        return task
    }
    fileprivate func makeJsonRequest<RT:Mappable>(method: HttpMethod, action: String, headers: [String:String] = [:], completion:@escaping (RT) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        
        let url = requestUrl(for: action)
        var request = URLRequest(url: URL(string:url)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20.0)
        
        //Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        //Add body data
        // Create JSON String from Model
        //let JSONString = Mapper().toJSONString(user, prettyPrint: true)
        request.httpBody = nil
        request.httpMethod = method.rawValue
        
        let task = urlSession.dataTask(with: request) {(data, response, taskError)  -> Void in
            
            //Clean the response to be traditional http response
            let httpResponse = self.cleanResponse(urlResponse: response)
            
            if httpResponse.wasSuccessful {
                let responseString = String(data: data!, encoding: String.Encoding.utf8)!
                if let mappedObject = Mapper<RT>().map(JSONString: responseString) {
                    DispatchQueue.main.async {
                        completion(mappedObject)
                    }
                }
                else {
                    let parseError = MapError(key: "", currentValue: "", reason: "Error parsing response object: \(RT.self)")
                    DispatchQueue.main.async {
                        error(parseError)
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    error(WebProviderError(error: taskError))
                }
            }
        }
        task.resume()
        
        return task
    }
    fileprivate func makeJsonRequest<T:Mappable,RT:Mappable>(method: HttpMethod, action: String, headers: [String:String] = [:], body: T?, completion: @escaping (RT) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        
        let url = requestUrl(for: action)
        var request = URLRequest(url: URL(string:url)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20.0)
        
        //Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        //Add body data
        // Create JSON String from Model
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body!.toJSON(), options: [])
            //print(String(data: jsonData, encoding: String.Encoding.utf8)!)
            request.httpBody = jsonData
        } catch {
            
        }
        request.httpMethod = method.rawValue
        
        let task = urlSession.dataTask(with: request) {(data, response, taskError)  -> Void in
            
            //Clean the response to be traditional http response
            let httpResponse = self.cleanResponse(urlResponse: response)
            
            if httpResponse.wasSuccessful {
                let responseString = String(data: data!, encoding: String.Encoding.utf8)!
                //print(responseString)
                
                if let mappedObject = Mapper<RT>().map(JSONString: responseString) {
                    DispatchQueue.main.async {
                        completion(mappedObject)
                    }
                }
                else {
                    let parseError = MapError(key: "", currentValue: "", reason: "Error parsing response object: \(RT.self)")
                    DispatchQueue.main.async {
                        error(parseError)
                    }
                }
            }
            else {
                if data != nil {
                    //let responseString = String(data: data!, encoding: String.Encoding.utf8)!
                    //print(responseString)
                }
                DispatchQueue.main.async {
                    error(WebProviderError(error: taskError))
                }
            }
        }
        task.resume()
        
        return task
    }
    fileprivate func makeDataRequest<RT:Mappable>(method: HttpMethod, action: String, headers: [String:String] = [:], data: Data, completion: @escaping (RT) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        
        let url = requestUrl(for: action)
        var request = URLRequest(url: URL(string:url)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20.0)
        
        //Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        //Add body data
        request.httpBody = data
        request.httpMethod = method.rawValue
        
        let task = urlSession.dataTask(with: request) {(data, response, taskError)  -> Void in
            
            //Clean the response to be traditional http response
            let httpResponse = self.cleanResponse(urlResponse: response)
            
            if httpResponse.wasSuccessful {
                let responseString = String(data: data!, encoding: String.Encoding.utf8)!
                //print(responseString)
                
                if let mappedObject = Mapper<RT>().map(JSONString: responseString) {
                    DispatchQueue.main.async {
                        completion(mappedObject)
                    }
                }
                else {
                    let parseError = MapError(key: "", currentValue: "", reason: "Error parsing response object: \(RT.self)")
                    DispatchQueue.main.async {
                        error(parseError)
                    }
                }
            }
            else {
                if data != nil {
                    //let responseString = String(data: data!, encoding: String.Encoding.utf8)!
                    //print(responseString)
                }
                DispatchQueue.main.async {
                    error(WebProviderError(error: taskError))
                }
            }
        }
        task.resume()
        
        return task
    }
    fileprivate func makeDataArrayRequest<RT:Mappable>(method: HttpMethod, action: String, headers: [String:String] = [:], data: Data, completion: @escaping ([RT]) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        
        let url = requestUrl(for: action)
        var request = URLRequest(url: URL(string:url)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20.0)
        
        //Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        //Add body data
        request.httpBody = data
        request.httpMethod = method.rawValue
        
        let task = urlSession.dataTask(with: request) {(data, response, taskError)  -> Void in
            
            //Clean the response to be traditional http response
            let httpResponse = self.cleanResponse(urlResponse: response)
            
            if httpResponse.wasSuccessful {
                let responseString = String(data: data!, encoding: String.Encoding.utf8)!
                //print(responseString)
                
                if let mappedObject = Mapper<RT>().mapArray(JSONString: responseString) {
                    DispatchQueue.main.async {
                        completion(mappedObject)
                    }
                }
                else {
                    let parseError = MapError(key: "", currentValue: "", reason: "Error parsing response object: \(RT.self)")
                    DispatchQueue.main.async {
                        error(parseError)
                    }
                }
            }
            else {
                if data != nil {
                    //let responseString = String(data: data!, encoding: String.Encoding.utf8)!
                    //print(responseString)
                }
                DispatchQueue.main.async {
                    error(WebProviderError(error: taskError))
                }
            }
        }
        task.resume()
        
        return task
    }
    fileprivate func makeVoidRequest(method: HttpMethod, action: String, headers: [String:String] = [:], completion: @escaping () -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        
        let url = requestUrl(for: action)
        var request = URLRequest(url: URL(string:url)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20.0)
        
        //Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        request.httpMethod = method.rawValue
        
        let task = urlSession.dataTask(with: request) {(data, response, taskError)  -> Void in
            
            //Clean the response to be traditional http response
            let httpResponse = self.cleanResponse(urlResponse: response)
            
            if httpResponse.wasSuccessful {
                //let responseString = String(data: data!, encoding: String.Encoding.utf8)!
                //print(responseString)
                DispatchQueue.main.async {
                    completion()
                }
            }
            else {
                if data != nil {
                    //let responseString = String(data: data!, encoding: String.Encoding.utf8)!
                    //print(responseString)
                }
                DispatchQueue.main.async {
                    error(WebProviderError(error: taskError))
                }
            }
        }
        task.resume()
        
        return task
    }
    fileprivate func makeVoidRequest<T:Mappable>(method: HttpMethod, action: String, headers: [String:String] = [:], body: T?, completion: @escaping () -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        
        let url = requestUrl(for: action)
        var request = URLRequest(url: URL(string:url)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20.0)
        
        //Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        //Add body data
        // Create JSON String from Model
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body!.toJSON(), options: [])
            //print(String(data: jsonData, encoding: String.Encoding.utf8)!)
            request.httpBody = jsonData
        } catch {
            
        }
        request.httpMethod = method.rawValue
        
        let task = urlSession.dataTask(with: request) {(data, response, taskError)  -> Void in
            
            //Clean the response to be traditional http response
            let httpResponse = self.cleanResponse(urlResponse: response)
            
            if httpResponse.wasSuccessful {
               // let responseString = String(data: data!, encoding: String.Encoding.utf8)!
                //print(responseString)
                
                DispatchQueue.main.async {
                    completion()
                }
            }
            else {
                if data != nil {
                    //let responseString = String(data: data!, encoding: String.Encoding.utf8)!
                    //print(responseString)
                }
                DispatchQueue.main.async {
                    error(WebProviderError(error: taskError))
                }
            }
        }
        task.resume()
        
        return task
    }
    fileprivate func makeRequest() -> MphProviderOperationProtocol {
        return URLSessionTask()
    }
    
    fileprivate func requestUrl(for action: String) -> String {
        let domain = (customDomain ?? mphDomain.rawValue)
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
    var wasSuccessful: Bool {
        return (self.statusCode >= 200 && self.statusCode < 300)
    }
}

public class WebProviderError: Error {
    init() {
        
    }
    
    init(error: Error?) {
        
    }
}
