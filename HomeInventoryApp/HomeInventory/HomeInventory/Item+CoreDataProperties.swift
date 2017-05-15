//
//  Item+CoreDataProperties.swift
//  HomeInventory
//
//  Created by RobElliott on 10/31/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var itemImage: NSData?
    @NSManaged var itemName: String?
    @NSManaged var purchaseDate: NSDate
    @NSManaged var purchasePrice: NSDecimalNumber?
    @NSManaged var serialNumber: String?
    @NSManaged var category: Category?
    @NSManaged var room: Room?

}
