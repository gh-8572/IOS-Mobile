//
//  ikea.swift
//  ikeaFinder
//
//  Created by smith, eric jay on 9/26/16.
//  Copyright © 2016 smith, eric jay. All rights reserved.
//

import UIKit

class IKEA: NSObject {
    var name: String
    var city: String
    var state: String
    var smalland: Bool
    var storeImage: String
    var latitude: Double
    var longitude: Double
    var distanceFromCurrentLocation: Double?
    
    
    init (name: String, city: String, state: String, smalland: Bool, storeImage: String, latitude: Double, longitude: Double) {
        self.name = name
        self.city = city
        self.state = state
        self.smalland = smalland
        self.storeImage = storeImage
        self.latitude = latitude
        self.longitude = longitude
        
        super.init()
    }
}
