//
//  FoodItemDataStore.swift
//  FoodLog
//
//  Created by Elliott, Rob on 12/5/16.
//  Copyright © 2016 RobElliott. All rights reserved.
//

import Foundation

class foodItemDataStore: NSObject {
    
    
    static let sharedInstance = foodItemDataStore()
    
    var foodItems = [FoodItem]()
    
}
