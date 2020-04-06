//
//  BoosterRequestModel.swift
//  Booster
//
//  Created by Ali Can OZKARA on 6.04.2020.
//  Copyright © 2020 Efectura. All rights reserved.
//

import UIKit

internal struct BoosterRequestModel: Codable {
    
    var UserId: String?
    var TaskId: String?
    var DateCallback: String?
    var DeviceId: String?
    var ShortLink: String?
    var Key: String?
    var Event: String?
    var DeviceType: String?
    
    init(userId:String, taskId:String, shortLink:String, event:String) {
        self.ShortLink = shortLink
        self.UserId = userId
        self.TaskId = taskId
        self.DateCallback = DateFormatter.sharedDateFormatter.string(from: Date())
        self.Key = "hello"
        self.DeviceId = UIDevice.current.identifierForVendor?.uuidString
        self.Event = event
        self.DeviceType = "IOS"
    }
    
}

extension Date {
    func toString( dateFormat format  : String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

extension DateFormatter {
    static var sharedDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return dateFormatter
    }()
}

extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}
