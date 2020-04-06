//
//  BoosterConfiguration.swift
//  Booster
//
//  Created by Ali Can OZKARA on 6.04.2020.
//  Copyright © 2020 Efectura. All rights reserved.
//

import Foundation

public class BoosterConfiguration: NSObject {
    public var baseProdUrl: String!
    public var baseQaUrl: String?
    public var environment: BoosterNetworkEnv? = .production
}
