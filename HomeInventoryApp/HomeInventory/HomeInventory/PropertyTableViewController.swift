//
//  PropertyTableViewController.swift
//  HomeInventory
//
//  Created by Rob Elliott on 10/18/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit

class PropertyTableViewController: UITableViewController {
    
    
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Property.getAllProperties().count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // WILL EXECUTE once FOR EACH TABLE CELL ON THE DISPLAY
        
        
        
        // Create or grab a reusable table cell
        let cell = tableView.dequeueReusableCellWithIdentifier("propertyCell", forIndexPath: indexPath) 
        
        
        
        // Get an instance of Property for the correct location in the table
        let thisProperty = Property.getAllProperties()[indexPath.row] as! Property
        
        cell.textLabel?.text = thisProperty.propertyName
        
        
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "segueRoomTVC" {
        
            // FIGURE OUT WHICH ROW WAS JUST TAPPED
            
            if let row = tableView.indexPathForSelectedRow?.row {
                
                let tappedProperty = Property.getAllProperties()[row] as! Property
                
                // FIGURE OUT THE DESTINATION VIEW CONTROLLER
                let roomTVC = segue.destinationViewController as! RoomTableViewController
                
                // PASS THE OBJECT FOR THAT ROW TO THE DESTINATION VIEW CONTROLLER
                roomTVC.selectedProperty = tappedProperty
                
            }
        
        } // END IF SEGUE IDENTIFIER

        
    } // END PREPARE FOR SEGUE
    

}









