//
//  PeopleTableViewController.swift
//  StarWarsAPI
//
//  Created by Rob Elliott on 11/11/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
    
    // VARIABLES
    
    var deletePersonIndexPath:NSIndexPath? = nil
    
    
    // EVENT LIFECYCLE METHODS
    
    override func viewWillAppear(animated: Bool) {
        
        // APIManager.sharedInstance.retrieveAllDataForModel("people")
        
    }
    
    
    override func viewDidLoad() {
        
        // REGISTER AS A LISTENER FOR THE NOTIFICATIONCENTER
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(self.catchNotification),
                                                         name: "PeopleDataRetrieved",
                                                         object: nil)
        
        
        // SET UP PULL-TO-REFRESH
        self.refreshControl?.addTarget(self,
                                       action: #selector(self.handleRefresh(_:)),
                                       forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    
    
    // TABLE VIEW CONTROLLER METHODS
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return StarWarsDataStore.sharedInstance.allPeople.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // THIS CODE RUNS ONCE FOR EACH TABLE CELL
        
        let cell = tableView.dequeueReusableCellWithIdentifier("personCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = StarWarsDataStore.sharedInstance.allPeople[indexPath.row].name as String?
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            deletePersonIndexPath = indexPath
            
            let personToDelete = StarWarsDataStore.sharedInstance.allPeople[indexPath.row]
            
            confirmDelete(personToDelete)
            
        }
        
        
    }
    
    
    // CUSTOM METHODS
    
    func catchNotification() {
        print("People data was retrieved")
        
        tableView.reloadData()
        
    }
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        
        APIManager.sharedInstance.retrieveAllDataForModel("people")
        refreshControl.endRefreshing()
    }
    
    
    func confirmDelete(person: Person) {
        
        let alert = UIAlertController(title: "Delete Person",
                                      message: "Are you sure you want to delete this person: \(person.name!)?",
                                      preferredStyle: .ActionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete",
                                         style: .Destructive,
                                         handler: handleDeletePerson)
        
        let CancelAction = UIAlertAction(title: "Cancel",
                                         style: .Cancel,
                                         handler: cancelDeletePerson)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func handleDeletePerson(alertAction: UIAlertAction!) -> Void {
        
        if let indexPath = deletePersonIndexPath {
            tableView.beginUpdates()
            
            StarWarsDataStore.sharedInstance.allPeople.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            deletePersonIndexPath = nil
            
            tableView.endUpdates()
        }
        
    }
    
    func cancelDeletePerson(alertAction: UIAlertAction!) -> Void {
        deletePersonIndexPath = nil
    }
    
    

}











