//
//  Category.swift
//  HomeInventory
//
//  Created by RobElliott on 10/31/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit
import CoreData


class Category: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    // Insert code here to add functionality to your managed object subclass
    
    // GET ALL PROPERTIES
    
    static func getAllCategories() -> [NSManagedObject] {
        
        // STEP 1a:
        // REFERENCE TO THE APP DELEGATE
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // STEP 1b:
        // REFERENCE TO THE MANAGED OBJECT CONTEXT
        let managedContext = appDelegate.managedObjectContext
        
        
        // STEP 2:
        // CREATE A FETCH REQUEST FOR A SPECIFIC ENTITY
        let fetchRequest = NSFetchRequest(entityName: "Category")
        
        
        // STEP 3:
        // CREATE A COLLECTION OF NSMANAGEDOBJECTS
        var allCategories = [NSManagedObject]()
        
        
        // STEP 4:
        // EXECUTE THE FETCH REQUEST
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            allCategories = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch categories \(error), \(error.userInfo)")
        }
        
        
        // STEP 5:
        
        return allCategories
        
    }
    
    
    // ADD A NEW CATEGORY
    
    static func addCategory(categoryName: String) {
        
        // STEP 1a:
        // REFERENCE TO THE APP DELEGATE
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // STEP 1b:
        // REFERENCE TO THE MANAGED OBJECT CONTEXT
        let managedContext = appDelegate.managedObjectContext
        
        
        // STEP 2:
        // DESCRIBE THE ENTITY (CLASS/ DB TABLE) WE WISH TO WORK WITH
        let entity = NSEntityDescription.entityForName("Category", inManagedObjectContext: managedContext)
        
        
        // STEP 3:
        // CREATE AN EMPTY INSTANCE OF THE ENTITY AND ADD IT TO THE M.O.C.
        let newCategory = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        
        // STEP 4:
        // ADD VALUES TO THE INSTANCE'S ATTRIBUTES
        newCategory.setValue(categoryName, forKey: "categoryName")
        
        
        // STEP 5:
        // SEND THE INSTANCE TO THE DATABASE VIA THE M.O.C. ("deliver the object")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            
            print("Could not save new category: \(error), \(error.userInfo)")
            
        }
        
    }


}
