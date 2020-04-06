//
//  ConfigDeviceResponse.swift
//  Booster
//
//  Created by Ali Can OZKARA on 6.04.2020.
//  Copyright © 2020 Efectura. All rights reserved.
//

import Foundation

internal struct ConfigDeviceResponse {
    let taskId: String?
    let trackId: String?
    let userId: String?
    let code: String?
}

extension ConfigDeviceResponse: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case taskId
        case trackId
        case userId
        case code
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taskId = try container.decode(String.self, forKey: .taskId)
        trackId = try container.decode(String.self, forKey: .trackId)
        userId = try container.decode(String.self, forKey: .userId)
        code = try container.decode(String.self, forKey: .code)
    }
}
