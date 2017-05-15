//
//  Category+CoreDataProperties.swift
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

extension Category {

    @NSManaged var categoryName: String?
    @NSManaged var items: NSSet?

}
