//
//  Restaurant.swift
//  FoodPin
//
//  Created by roger on 26/10/16.
//  Copyright © 2016 roger. All rights reserved.
//

import UIKit

class Restaurant: NSObject {
    var name = ""
    var type = ""
    var location = ""
    var phone = ""
    var image = ""
    var isVisited = false
    
    init(name: String, type: String, location: String, phone: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.image = image
        self.isVisited = isVisited
    }
}
