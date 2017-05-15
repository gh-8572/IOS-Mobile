//
//  FoodInfoDataStore.swift
//  FoodLog
//
//  Created by Crouch, Joshua W on 11/30/16.
//  Copyright © 2016 RobElliott. All rights reserved.
//

import Foundation

class FoodInfoDataStore: NSObject{
    
    //create as singleton
    static let sharedInstance = FoodInfoDataStore()
    
    //declare array of all foods
    
    var allFoodInfo = [FoodItem]()
    
}