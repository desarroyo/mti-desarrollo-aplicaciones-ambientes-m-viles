//
//  UserModel.swift
//  sesion-6-7
//
//  Created by CTA CUCEA on 6/14/19.
//  Copyright © 2019 CTA CUCEA. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserModel{
    var id:Int?
    var name:String
    var username: String?
    var street:String?
    var city:String?
    var lat:Double?
    var lon:Double?
    
    init(object:JSON){
        id = object["id"].int
        name = object["name"].stringValue
        username = object["username"].stringValue
        street = object["address"]["street"].stringValue
        city = object["address"]["city"].stringValue
        lat = object["address"]["geo"]["lat"].doubleValue
        lon = object["address"]["geo"]["lon"].doubleValue
    }
}
