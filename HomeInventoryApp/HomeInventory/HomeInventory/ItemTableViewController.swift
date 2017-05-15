//
//  ItemTableViewController.swift
//  HomeInventory
//
//  Created by Rob Elliott on 10/18/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    var selectedRoom: Room!
    
    // CHECK THAT OBJECT WAS PASSED
    override func viewDidAppear(animated: Bool) {
        print(selectedRoom.roomName)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Item.getAllItemsForRoom(selectedRoom).count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // WILL EXECUTE once FOR EACH TABLE CELL ON THE DISPLAY
        
        
        
        // Create or grab a reusable table cell
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath)
        
        
        
        // Get an instance of Item for the correct location in the table
        let thisItem = Item.getAllItemsForRoom(selectedRoom)[indexPath.row] as! Item
        
        cell.textLabel?.text = thisItem.itemName
        
        cell.detailTextLabel?.text = thisItem.category?.categoryName
        
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "segueAddItemVC" {
            
            // FIGURE OUT THE DESTINATION VIEW CONTROLLER
            let addItemVC = segue.destinationViewController as! AddItemViewController
            
            // PASS THE OBJECT FOR THAT ROW TO THE DESTINATION VIEW CONTROLLER
            addItemVC.selectedRoom = selectedRoom
            
        }// END IF SEGUE IDENTIFIER
        else if segue.identifier == "segueDetailVC" {
            
            if let row = tableView.indexPathForSelectedRow?.row {
                
                let tappedItem = Item.getAllItemsForRoom(selectedRoom)[row] as! Item
                
                let itemDetailVC = segue.destinationViewController as! ItemDetailViewController
                
                itemDetailVC.selectedItem = tappedItem
            }
        }
        
        
    } // END PREPARE FOR SEGUE

}