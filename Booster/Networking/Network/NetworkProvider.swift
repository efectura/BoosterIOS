//
//  NetworkProvider.swift
//  Booster
//
//  Created by Ali Can OZKARA on 6.04.2020.
//  Copyright © 2020 Efectura. All rights reserved.
//

import Foundation

internal class NetworkProvider {

    public func makeAPI() -> API {
        let network = Network()
        return API(network: network)
    }
    
}
