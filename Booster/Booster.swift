//
//  Booster.swift
//  Booster
//
//  Created by Ali Can OZKARA on 6.04.2020.
//  Copyright © 2020 Efectura. All rights reserved.
//

import Foundation

internal class Config {
    
    static let shared = Config()
    
    var configuration: BoosterConfiguration!
    
    private init(){}
    
}

public class Booster {
    
    private static let service = NetworkProvider()
    
    public static func configure(with config: BoosterConfiguration){
        Config.shared.configuration = config
        
        let deviceInfo = DeviceInfo()
        
        if let device = deviceInfo.getDeviceModel() {

            service.makeAPI().configDevice(ipAddress: deviceInfo.getIPAddress(), phoneModel: device) { (response, error, responseCode) in
                
                if error == nil && responseCode == 200 {
                    if let user = response?.userId, let task = response?.taskId, let link = response?.code {
                        let param: [String: String] = ["userId": user, "taskId": task, "shortLink": link]
                        self.deeplinkHandler(dict: param)
                    }
                }

            }
        }
    }
    
    private static func deeplinkHandler(dict: [String: String]){
        
        if let userId = dict["userId"], let taskId = dict["taskId"], let shortLink = dict["shortLink"] {
        
            let requestBodyObject = BoosterRequestModel(userId: userId, taskId: taskId, shortLink: shortLink, event: "1")
            
            service.makeAPI().deeplink(param: requestBodyObject) { (response, error, responseCode) in
                
            }
            
        }
        
    }
    
}
