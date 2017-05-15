//
//  ikeaTableViewController.swift
//  ikeaFinder
//
//  Created by smith, eric jay on 9/26/16.
//  Copyright © 2016 smith, eric jay. All rights reserved.
//

import UIKit

class IKEATableViewController: UITableViewController {
 
    
    //var ideaDataSore: ideaDataStore!
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
        
        return ikeaDataStore.sharedInstance.allIKEAs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       //will execute once for each table cell on the display
        
      //create or grab a reusable table cell
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
     
        //get an instance of IKEA for the correct location in the table
        let IKEALocation = ikeaDataStore.sharedInstance.allIKEAs[indexPath.row]
        
        cell.textLabel?.text = IKEALocation.name
        
        return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        //check the segue name
        
        if segue.identifier == "ikeaDetail" {
            
            //figure out which row was just tapped
            
            if let row = tableView.indexPathForSelectedRow?.row {
                print("\(row)")
                
                
                let tappedIKEA = ikeaDataStore.sharedInstance.allIKEAs[row]
                
                let detailVC = segue.destinationViewController as! DetailViewController
                
                detailVC.thisIKEA = tappedIKEA
                
            }
            print("executing segue")
        }
    
    }
}
