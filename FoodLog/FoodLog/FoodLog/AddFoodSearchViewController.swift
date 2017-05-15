//
//  AddFoodSearchViewController.swift
//  FoodLog
//
//  Created by Rust, Matthew Carlton on 11/28/16.
//  Copyright © 2016 RobElliott. All rights reserved.
//

import UIKit

class AddFoodSearchViewController: UIViewController {
    
    @IBOutlet weak var txtFoodSearch: UITextField!
    
    var retrievedFoodItems: [FoodItem]!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "segueAddFoodSearch" {
            
            APIManager.sharedInstance.retrieveAllDataFromAPI("txtFoodSearch")
            
        }
        
    }
    
}
