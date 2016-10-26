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
    var image = ""
    var isVisited = false
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}
