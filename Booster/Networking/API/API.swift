//
//  API.swift
//  Booster
//
//  Created by Ali Can OZKARA on 6.04.2020.
//  Copyright © 2020 Efectura. All rights reserved.
//

import Foundation


internal protocol APIProtocols {
    func configDevice(ipAddress: String, phoneModel: String, completion: @escaping (_ result: ConfigDeviceResponse?, _ error: String?, _ responseCode: Int) -> Void)
    func deeplink(param: BoosterRequestModel, completion: @escaping (_ result: ConfigDeviceResponse?, _ error: String?, _ responseCode: Int) -> Void)
}

internal final class API: APIProtocols {
    
    private let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func configDevice(ipAddress: String, phoneModel: String, completion: @escaping (ConfigDeviceResponse?, String?, Int) -> Void) {
        
        self.network.genericFetch(.configDevice(ipAddress: ipAddress, phoneModel: phoneModel)) { (data: ConfigDeviceResponse?, error, responseCode) in
            completion(data, error, responseCode)
        }
    }
    
    func deeplink(param: BoosterRequestModel, completion: @escaping (ConfigDeviceResponse?, String?, Int) -> Void) {
        
        self.network.genericFetch(.deeplink(param: param)) { (data: ConfigDeviceResponse?, error, responseCode) in
            completion(data, error, responseCode)
        }
    }
}
