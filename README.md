# MiningPoolHub-Swift
MiningPoolHub-Swift is a complete API wrapper for the [miningpoolhub.com API](https://github.com/miningpoolhub/php-mpos/wiki/API-Reference) written in the Swift language. All working calls, both authenticated and unauthenticated are available natively in swift code. The goal was to empower others to help build applications for this great community.

Built in Swift 4.0

### Donate

<span><img width=13px src="https://i.pinimg.com/originals/c2/9e/0c/c29e0cba21b01826ab5d87187bd2c793.png" />
</span><span><b>bitcoin:</b>     17ZEBFw5peuoUwYaEJeGkpoJwP1htViLUY </span>


<span><img width=13px src="https://getcoin.site/litecoin/LTC.png" />
</span><span><b>litecoin:</b>     LSzwWG35KqfuR5SEiKeJrGq4L3Z36vzjdR </span>

<span><img width=13px src="https://cdn4.iconfinder.com/data/icons/cryptocoins/227/ETH-alt-128.png" />
</span><span><b>ethereum:</b>     0x339c744e0c08862c0943431079e5a406413bf4ed </span>

## Installation

**CocoaPods**

<code>pod 'MiningPoolHub-Swift'</code>

**Manual Installation**

Copy into your project all the files found in <code>MiningPoolHub/Sources</code>

## How To Use

#### What you need

First, visit [miningpoolhub.com](miningpoolhub.com) and click on "Edit Profile". Retrieve your API key for use below.

*Note: Some calls have an id field. This is normally used to specify the user associated with a given call. It is my observation that if this is left nil, the user will be identified from the API key

#### Import Files
If using cocoapods, import the library: <code>import MiningPoolHub_Swift</code>

#### Making a Request
To make a request to the MiningPoolHub API, simply do the following
```swift
let api_key = "YOUR_API_KEY"
let config = MphDefaultConfiguration(apiKey: api_key)
let provider = MphWebProvider(configuration: config)
        
//Make web call
let task = provider.getAutoSwitchingAndProfitsStatistics(completion: { (response: MphListResponse<MphAutoSwitchingProfitStatistics>) in
            print(response.toJSON())
        }) { (error: Error) in
            print(error.localizedDescription)
        }
```

That's it! Swift bjects are returned fully parsed and ready to use!

#### Cancelling a Request
To make a request to task, simply call: <code>task.cancel()</code>

#### Domains
The domains have been enumerated and are a variable on the MphWebProvider. To set the domain of interest, simply call
```swift
provider.set(domain: .litecoin)
```

Use the default <code>.root</code> domain for the root domain of the site. For a perhaps newly released custom domain not yet supported by enumeration, call

```swift
provider.setCustom(domain: "someCustomDomain")
```

### Thanks
A special thanks to MiningPoolHub for a great community and site!
