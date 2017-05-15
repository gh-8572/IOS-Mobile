//
//  Room.swift
//  HomeInventory
//
//  Created by RobElliott on 10/18/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit
import CoreData


class Room: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    // GET ALL ROOMS
    
    static func getAllRooms() -> [NSManagedObject] {
        
        // STEP 1a:
        // REFERENCE TO THE APP DELEGATE
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // STEP 1b:
        // REFERENCE TO THE MANAGED OBJECT CONTEXT
        let managedContext = appDelegate.managedObjectContext
        
        
        // STEP 2:
        // CREATE A FETCH REQUEST FOR A SPECIFIC ENTITY
        let fetchRequest = NSFetchRequest(entityName: "Room")
        
        
        // STEP 3:
        // CREATE A COLLECTION OF NSMANAGEDOBJECTS (PROPERTIES)
        var allRooms = [NSManagedObject]()
        
        
        // STEP 4:
        // EXECUTE THE FETCH REQUEST
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            allRooms = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch rooms \(error), \(error.userInfo)")
        }
        
        
        // STEP 5: RETURN THE ARRAY
        
        return allRooms
        
    }
    
    static func getAllRoomsForProperty(selectedProperty: Property) -> [NSManagedObject] {
        
        // STEP 1a:
        // REFERENCE TO THE APP DELEGATE
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // STEP 1b:
        // REFERENCE TO THE MANAGED OBJECT CONTEXT
        let managedContext = appDelegate.managedObjectContext
        
        
        // STEP 2:
        // CREATE A FETCH REQUEST FOR A SPECIFIC ENTITY
        let fetchRequest = NSFetchRequest(entityName: "Room")
        
        
        // STEP 3:
        // CREATE A COLLECTION OF NSMANAGEDOBJECTS (PROPERTIES)
        var allRooms = [NSManagedObject]()
        
        
        // STEP 4:
        // ADD AN NSPREDICATE
        let predicate = NSPredicate(format: "property == %@", selectedProperty)
        
        fetchRequest.predicate = predicate
        
        
        // STEP 5:
        // EXECUTE THE FETCH REQUEST
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            allRooms = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch rooms \(error), \(error.userInfo)")
        }
        
        
        // STEP 6: RETURN THE ARRAY
        
        return allRooms
        
    }
    
    
    // ADD A NEW ROOM
    
    static func addRoom(roomName: String, selectedProperty: Property, floor: String) {
        
        // STEP 1a:
        // REFERENCE TO THE APP DELEGATE
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // STEP 1b:
        // REFERENCE TO THE MANAGED OBJECT CONTEXT
        let managedContext = appDelegate.managedObjectContext
        
        
        // STEP 2:
        // DESCRIBE THE ENTITY (CLASS/ DB TABLE) WE WISH TO WORK WITH
        let entity = NSEntityDescription.entityForName("Room", inManagedObjectContext: managedContext)
        
        
        // STEP 3:
        // CREATE AN EMPTY INSTANCE OF THE ENTITY AND ADD IT TO THE M.O.C.
        let newRoom = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        
        // STEP 4:
        // ADD VALUES TO THE INSTANCE'S ATTRIBUTES
        newRoom.setValue(roomName, forKey: "roomName")
        newRoom.setValue(selectedProperty, forKey: "property")
        newRoom.setValue(floor, forKey: "floor")
        
        
        // STEP 5:
        // SEND THE INSTANCE TO THE DATABASE VIA THE M.O.C. ("deliver the object")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            
            print("Could not save new room: \(error), \(error.userInfo)")
            
        }
        
    }

}
