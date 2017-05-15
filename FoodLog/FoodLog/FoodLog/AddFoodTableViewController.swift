//
//  AddFoodTableViewController.swift
//  FoodLog
//
//  Created by Rust, Matthew Carlton on 11/28/16.
//  Copyright © 2016 RobElliott. All rights reserved.
//

import UIKit

class AddFoodTableViewController: UITableViewController {
    
    
    var passedFood: [FoodItem]!
    
    override func viewDidLoad() {
        
        passedFood = foodItemDataStore.sharedInstance.foodItems
        
    }
    
    
    // TABLE VIEW CONTROLLER METHODS
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return passedFood.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("foodCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = passedFood[indexPath.row].foodName as String?
        cell.detailTextLabel?.text = String(passedFood[indexPath.row].calories)
        
        return cell
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueViewLogTableView" {
            //Figure out which row was tapped
            /*
            if let row = tableView.indexPathForSelectedRow?.row {
                
                let tappedFood = Food.getAllDetailsForFood(selectedFood)[row] as! Food
                
                //Figure out the destination viewController
                let logVC = segue.destinationViewController as! ViewLogTableViewController
                
                //Pass the object for that row to the next viewController
                logVC.selectedFood = tappedFood
                
            }
            */
        }
    }
    
}
