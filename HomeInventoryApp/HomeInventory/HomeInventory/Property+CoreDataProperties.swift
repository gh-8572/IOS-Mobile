//
//  Property+CoreDataProperties.swift
//  HomeInventory
//
//  Created by RobElliott on 10/18/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Property {

    @NSManaged var propertyName: String?
    @NSManaged var streetAddress: String?
    @NSManaged var city: String?
    @NSManaged var state: String?
    @NSManaged var country: String?
    @NSManaged var postalCode: String?
    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var rooms: NSSet?

}
