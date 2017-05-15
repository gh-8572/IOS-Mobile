//
//  Property.swift
//  HomeInventory
//
//  Created by RobElliott on 10/18/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit
import CoreData


class Property: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    // GET ALL PROPERTIES
    
    static func getAllProperties() -> [NSManagedObject] {
        
        // STEP 1a:
        // REFERENCE TO THE APP DELEGATE
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // STEP 1b:
        // REFERENCE TO THE MANAGED OBJECT CONTEXT
        let managedContext = appDelegate.managedObjectContext
        
        
        // STEP 2:
        // CREATE A FETCH REQUEST FOR A SPECIFIC ENTITY
        let fetchRequest = NSFetchRequest(entityName: "Property")
        
        
        // STEP 3:
        // CREATE A COLLECTION OF NSMANAGEDOBJECTS (PROPERTIES)
        var allProperties = [NSManagedObject]()
        
        
        // STEP 4:
        // EXECUTE THE FETCH REQUEST
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            allProperties = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch properties \(error), \(error.userInfo)")
        }
        
        
        // STEP 5:PROPERTIES
        
        return allProperties
        
    }
    
    
    // ADD A NEW PROPERTY
    
    static func addProperty(propertyName: String, streetAddress: String, city: String, state: String, Zip: String, country: String) {
        
        // STEP 1a:
        // REFERENCE TO THE APP DELEGATE
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // STEP 1b:
        // REFERENCE TO THE MANAGED OBJECT CONTEXT
        let managedContext = appDelegate.managedObjectContext
        
        
        // STEP 2:
        // DESCRIBE THE ENTITY (CLASS/ DB TABLE) WE WISH TO WORK WITH
        let entity = NSEntityDescription.entityForName("Property", inManagedObjectContext: managedContext)
        
        
        // STEP 3:
        // CREATE AN EMPTY INSTANCE OF THE ENTITY AND ADD IT TO THE M.O.C.
        let newProperty = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        
        // STEP 4:
        // ADD VALUES TO THE INSTANCE'S ATTRIBUTES
        newProperty.setValue(propertyName, forKey: "propertyName")
        newProperty.setValue(streetAddress, forKey: "streetAddress")
        newProperty.setValue(city, forKey: "city")
        newProperty.setValue(state, forKey: "state")
        newProperty.setValue(Zip, forKey: "postalCode")
        newProperty.setValue(country, forKey: "country")
        
        
        // STEP 5:
        // SEND THE INSTANCE TO THE DATABASE VIA THE M.O.C. ("deliver the object")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            
            print("Could not save new property: \(error), \(error.userInfo)")
            
        }
        
    }


}
