//
//  FilmsTableViewController.swift
//  StarWarsAPI
//
//  Created by Rob Elliott on 11/11/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit

class FilmsTableViewController: UITableViewController {
    
    // VARIABLES
    
    var deleteFilmIndexPath:NSIndexPath? = nil
    
    
    // EVENT LIFECYCLE METHODS
    
    override func viewWillAppear(animated: Bool) {
        
         APIManager.sharedInstance.retrieveAllDataForModel("films")
        
    }
    
    
    override func viewDidLoad() {
        
        // REGISTER AS A LISTENER FOR THE NOTIFICATIONCENTER
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(self.catchNotification),
                                                         name: "FilmDataRetrieved",
                                                         object: nil)
        
        
        // SET UP PULL-TO-REFRESH
        self.refreshControl?.addTarget(self,
                                       action: #selector(self.handleRefresh(_:)),
                                       forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    
    
    // TABLE VIEW CONTROLLER METHODS
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return StarWarsDataStore.sharedInstance.allFilms.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // THIS CODE RUNS ONCE FOR EACH TABLE CELL
        
        let cell = tableView.dequeueReusableCellWithIdentifier("filmCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = StarWarsDataStore.sharedInstance.allFilms[indexPath.row].title as String?
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            deleteFilmIndexPath = indexPath
            
            let filmToDelete = StarWarsDataStore.sharedInstance.allFilms[indexPath.row]
            
            confirmDelete(filmToDelete)
            
        }
        
        
    }
    
    
    // CUSTOM METHODS
    
    func catchNotification() {
        print("Film data was retrieved")
        
        tableView.reloadData()
        
    }
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        
        APIManager.sharedInstance.retrieveAllDataForModel("films")
        refreshControl.endRefreshing()
    }
    
    
    func confirmDelete(film: Film) {
        
        let alert = UIAlertController(title: "Delete film",
                                      message: "Are you sure you want to delete this film: \(film.title!)?",
                                      preferredStyle: .ActionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete",
                                         style: .Destructive,
                                         handler: handleDeleteFilm)
        
        let CancelAction = UIAlertAction(title: "Cancel",
                                         style: .Cancel,
                                         handler: cancelDeleteFilm)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func handleDeleteFilm(alertAction: UIAlertAction!) -> Void {
        
        if let indexPath = deleteFilmIndexPath {
            tableView.beginUpdates()
            
            StarWarsDataStore.sharedInstance.allFilms.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            deleteFilmIndexPath = nil
            
            tableView.endUpdates()
        }
        
    }
    
    func cancelDeleteFilm(alertAction: UIAlertAction!) -> Void {
        deleteFilmIndexPath = nil
    }
    
    
    
}
