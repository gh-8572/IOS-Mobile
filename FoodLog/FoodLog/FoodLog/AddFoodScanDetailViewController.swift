//
//  AddFoodScanDetailViewController.swift
//  FoodLog
//
//  Created by Rust, Matthew Carlton on 11/28/16.
//  Copyright © 2016 RobElliott. All rights reserved.
//

import UIKit

class AddFoodScanDetailViewController: UIViewController {
    
    @IBOutlet weak var txtFoodQuantity: UITextField!
    @IBOutlet weak var txtFoodName: UILabel!
    
    var foodID: String!
    var foodName: String!
    
    override func viewDidLoad() {
        
        txtFoodName.text = foodName
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "segueAddFoodScan" {
            
            var destinationTableController = segue.destinationViewController as! AddFoodTableViewController
            
            
        }
        
    }
}
