//
//  AddFoodScanViewController.swift
//  FoodLog
//
//  Created by Rust, Matthew Carlton on 11/28/16.
//  Copyright © 2016 RobElliott. All rights reserved.
//

import UIKit

class AddFoodScanViewController: UIViewController {
    
    var foodAPIID: String!
    var foodAPIName: String!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "segueAddFoodScanDetails" {
            
            var destinationTableController = segue.destinationViewController as! AddFoodScanDetailViewController
            
            destinationTableController.foodName = foodAPIName
            destinationTableController.foodID = foodAPIID
            
        }
        
    }
    
}
