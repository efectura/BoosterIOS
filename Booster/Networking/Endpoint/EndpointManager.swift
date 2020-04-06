//
//  EndpointManager.swift
//  Booster
//
//  Created by Ali Can OZKARA on 6.04.2020.
//  Copyright © 2020 Efectura. All rights reserved.
//

import Foundation

private let environment: BoosterNetworkEnv = .production

internal enum EndpointManager {
    case configDevice(ipAddress: String, phoneModel: String)
    case deeplink(param: BoosterRequestModel)
}

extension EndpointManager: EndPointType {
    
    var baseURL: URL {
        switch environment {
        case .production:
            guard let url = URL(string: Config.shared.configuration.baseProdUrl) else { fatalError("production url could not be configured.") }
            return url
        case .qa:
            guard let url = URL(string: Config.shared.configuration.baseQaUrl ?? Config.shared.configuration.baseProdUrl) else { fatalError("qa url could not be configured.") }
            return url
        }
    }
    
    var path: String {
        switch self {
        case .configDevice:
            return "/api/ShortLink/GetIOSDynamicLink"
        case .deeplink:
            return "/api/Misc/GetFirebase"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .configDevice:
            return .post
        case .deeplink:
            return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .configDevice(let ipAddress, let phoneModel):
            let param: [String: Any] = ["IpAddress": ipAddress, "OsVersion": phoneModel]
            return .requestParametersAndHeaders(bodyParameters: param, bodyEncoding: .jsonEncoding,
                                                urlParameters: nil,
                                                additionHeaders: headers)
        case .deeplink(let param):
            let parameter: [String: Any?] = ["UserId": param.UserId, "TaskId": param.TaskId, "DateCallback": param.DateCallback, "DeviceId": param.DeviceId, "ShortLink": param.ShortLink, "Key": param.Key, "Event": param.Event, "DeviceType": param.DeviceType]
            return .requestParametersAndHeaders(bodyParameters: parameter, bodyEncoding: .jsonEncoding,
                                                urlParameters: nil,
                                                additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var contentType: ContentType {
        return .json
    }
}
