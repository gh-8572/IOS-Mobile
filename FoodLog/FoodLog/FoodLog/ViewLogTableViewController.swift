//
//  ViewLogTableViewController.swift
//  FoodLog
//
//  Created by Rust, Matthew Carlton on 11/28/16.
//  Copyright © 2016 RobElliott. All rights reserved.
//

import UIKit

class ViewLogTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Define outlets to view objects
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblCalorieCount: UILabel!
    
    var consumeDate: NSTimeInterval!
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    // Test Data Var
    var items: [String] = ["Fish", "Steak", "Chicken", "Beef"]
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // return FoodItem.getAllFoodItems(consumeDate).count
        
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = self.tableView.dequeueReusableCellWithIdentifier("cellFoodLogItem")
        
        cell!.textLabel?.text = self.items[indexPath.row]
        
        // let thisFoodItem = FoodItem.getAllFoodItems(consumeDate)[indexPath.row] as! FoodItem
        
        // cell!.textLabel?.text = thisFoodItem.foodName
        
        return cell!
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "segueViewNutritionDetails" {
            
            let viewNutritionDetailVC = segue.destinationViewController as! ViewNutritionDetailViewController
            
            // let selectedFoodItem = FoodItem.getAllFoodItems(consumeDate)[tableView.indexPathForSelectedRow]
            
            // viewNutritionDetailVC.selectedFoodItem = selectedFoodItem
            
        }
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    


    

}
