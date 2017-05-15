//
//  FoodItem.swift
//  FoodLog
//
//  Created by Crouch, Joshua W on 11/30/16.
//  Copyright © 2016 RobElliott. All rights reserved.
//

import CoreData
import UIKit


class FoodItem: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    static func getFoodInfo()-> [NSManagedObject] {
        
        //Reference the App Delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //Reference the managed object context
        let managedContext = appDelegate.managedObjectContext
        
        //Create fetch request
        let fetchRequest = NSFetchRequest(entityName: "FoodItem")
        
        //create the fetched object array
        var allFood = [NSManagedObject]()
        
        //execute fetch request
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            allFood = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch food \(error), \(error.userInfo)")
        }
        
        return allFood
    }
    


    //Adding items to the data store
    static func addFoodItem(thisFoodItem:FoodItem){
        
        //Reference the App Delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //Reference the managed object context
        let managedContext = appDelegate.managedObjectContext
        
        //Describe entity worked with
        let entity = NSEntityDescription.entityForName("FoodItem", inManagedObjectContext: managedContext)
        
        //Create an empty instance and add to M.O.C.
        let newFoodItem = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        let photoThumb = NSData(contentsOfURL: NSURL(string:thisFoodItem.photoURL!)!)
        
        //add values to instance attribute
        newFoodItem.setValue(thisFoodItem.foodName, forKey: "foodName")
        newFoodItem.setValue(thisFoodItem.brandName, forKey: "brandName")
        newFoodItem.setValue(thisFoodItem.servingQuantity, forKey: "servingQuantity")
        newFoodItem.setValue(thisFoodItem.servingUnit, forKey: "servingUnit")
        newFoodItem.setValue(thisFoodItem.servingWeightGrams, forKey: "servingWeightGrams")
        newFoodItem.setValue(thisFoodItem.calories, forKey: "calories")
        newFoodItem.setValue(thisFoodItem.totalFat, forKey: "totalFat")
        newFoodItem.setValue(thisFoodItem.totalCarbs, forKey: "totalCarbs")
        newFoodItem.setValue(thisFoodItem.sodium, forKey: "sodium")
        newFoodItem.setValue(thisFoodItem.cholesterol, forKey: "cholesterol")
        newFoodItem.setValue(thisFoodItem.saturatedFat, forKey: "saturatedFat")
        newFoodItem.setValue(thisFoodItem.dietaryFiber, forKey: "dietaryFiber")
        newFoodItem.setValue(thisFoodItem.sugar, forKey: "sugar")
        newFoodItem.setValue(thisFoodItem.protein, forKey: "protein")
        newFoodItem.setValue(thisFoodItem.potassium, forKey: "potassium")
        newFoodItem.setValue(thisFoodItem.upc, forKey: "upc")
        newFoodItem.setValue(thisFoodItem.photoURL, forKey: "photoURL")
        newFoodItem.setValue(photoThumb, forKey: "photoThumb")
        newFoodItem.setValue(thisFoodItem.consumeDate, forKey: "consumeDate")


        
        
        
        //Send the instance to the DB via the MOC
        
        do {
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save new room: \(error), \(error.userInfo)")
        }


        
    }
    
}
