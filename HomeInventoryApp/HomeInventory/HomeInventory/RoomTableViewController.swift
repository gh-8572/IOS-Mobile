//
//  RoomTableViewController.swift
//  HomeInventory
//
//  Created by Rob Elliott on 10/18/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit

class RoomTableViewController: UITableViewController {
    
    var selectedProperty: Property!
    
    // CHECK THAT OBJECT WAS PASSED
    override func viewDidAppear(animated: Bool) {
        print(selectedProperty.propertyName)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Room.getAllRoomsForProperty(selectedProperty).count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // WILL EXECUTE once FOR EACH TABLE CELL ON THE DISPLAY
        
        
        
        // Create or grab a reusable table cell
        let cell = tableView.dequeueReusableCellWithIdentifier("roomCell", forIndexPath: indexPath)
        
        
        
        // Get an instance of Room for the correct location in the table
        let thisRoom = Room.getAllRoomsForProperty(selectedProperty)[indexPath.row] as! Room
        
        cell.textLabel?.text = thisRoom.roomName
        
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "segueAddRoomVC" {
            
            // FIGURE OUT THE DESTINATION VIEW CONTROLLER
            let addRoomVC = segue.destinationViewController as! AddRoomViewController
            
            // PASS THE OBJECT FOR THAT ROW TO THE DESTINATION VIEW CONTROLLER
            addRoomVC.selectedProperty = selectedProperty
            
        } else if segue.identifier == "segueItemTVC" {
            
            if let row = tableView.indexPathForSelectedRow?.row {
                
                let tappedRoom = Room.getAllRoomsForProperty(selectedProperty)[row] as! Room

            
                // FIGURE OUT THE DESTINATION VIEW CONTROLLER
                let itemTVC = segue.destinationViewController as! ItemTableViewController
            
                itemTVC.selectedRoom = tappedRoom
            }
            
            
        }// END IF SEGUE IDENTIFIER
        
        
    } // END PREPARE FOR SEGUE
    

    
}