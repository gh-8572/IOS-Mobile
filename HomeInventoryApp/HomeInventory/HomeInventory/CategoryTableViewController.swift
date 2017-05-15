//
//  CategoryTableViewController.swift
//  HomeInventory
//
//  Created by Rob Elliott on 10/18/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Category.getAllCategories().count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // WILL EXECUTE once FOR EACH TABLE CELL ON THE DISPLAY
        
        
        
        // Create or grab a reusable table cell
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath)
        
        
        
        // Get an instance of Category for the correct location in the table
        let thisCategory = Category.getAllCategories()[indexPath.row] as! Category
        
        cell.textLabel?.text = thisCategory.categoryName
        
        
        return cell
        
    }
    
}