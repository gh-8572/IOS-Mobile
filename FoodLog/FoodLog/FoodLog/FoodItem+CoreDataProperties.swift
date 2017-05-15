//
//  FoodItem+CoreDataProperties.swift
//  FoodLog
//
//  Created by Crouch, Joshua W on 12/5/16.
//  Copyright © 2016 RobElliott. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension FoodItem {

    @NSManaged var brandName: String?
    @NSManaged var calories: Double
    @NSManaged var cholesterol: Double
    @NSManaged var consumeDate: NSTimeInterval
    @NSManaged var dietaryFiber: Double
    @NSManaged var foodName: String?
    @NSManaged var photoThumb: NSObject?
    @NSManaged var potassium: Double
    @NSManaged var protein: Double
    @NSManaged var saturatedFat: Double
    @NSManaged var servingQuantity: Double
    @NSManaged var servingUnit: Double
    @NSManaged var servingWeightGrams: Double
    @NSManaged var sodium: Double
    @NSManaged var sugar: Double
    @NSManaged var totalCarbs: Double
    @NSManaged var totalFat: Double
    @NSManaged var upc: String?
    @NSManaged var photoURL: String?

}
