//
//  Network.swift
//  Booster
//
//  Created by Ali Can OZKARA on 6.04.2020.
//  Copyright © 2020 Efectura. All rights reserved.
//

import Foundation

internal enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

internal enum Result<String> {
    case success
    case failure(String)
}

internal struct Network {

    
    func genericFetch<T: Decodable>(_ endpoint: EndpointManager, completion: @escaping (T?, String?, Int) -> Void) {

        let router = RouterProvider().makeRouter()

        router.request(endpoint) { data, response, error in
            
            if error != nil {
                completion(nil, "Please check your network connection.", 0)
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue, response.statusCode)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(T.self, from: responseData)
                        completion(apiResponse, nil, response.statusCode)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue, response.statusCode)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError, response.statusCode)
                }
            }
        }
    }

    
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...204, 400, 409:
            return .success
        case 501...599:
            return .failure(NetworkResponse.badRequest.rawValue)
        case 600:
            return .failure(NetworkResponse.outdated.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
