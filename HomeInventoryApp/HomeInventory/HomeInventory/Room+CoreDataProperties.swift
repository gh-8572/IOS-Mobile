//
//  Room+CoreDataProperties.swift
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

extension Room {

    @NSManaged var roomName: String?
    @NSManaged var floor: String?
    @NSManaged var property: Property?

}
