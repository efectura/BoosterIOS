//
//  RouterProvider.swift
//  Booster
//
//  Created by Ali Can OZKARA on 6.04.2020.
//  Copyright © 2020 Efectura. All rights reserved.
//

import Foundation

internal class RouterProvider {
    
    public func makeRouter() -> Router<EndpointManager> {
        return Router<EndpointManager>()
    }
    
}
