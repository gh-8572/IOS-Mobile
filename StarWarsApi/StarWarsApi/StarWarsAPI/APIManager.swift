//
//  APIManager.swift
//  StarWarsAPI
//
//  Created by Rob Elliott on 11/11/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    
    // MAKE THIS CLASS A SINGLETON
    static let sharedInstance = APIManager()
    
    // OBJECT FOR SENDING AND RECEIVING HTTP REQUESTS
    let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    // A NSURLSessionDataTask TO EXECUTE A "GET" REQUEST AND RETRIEVE DATA INTO MEMORY
    var dataTask: NSURLSessionDataTask?
    
    
    // FUNCTION TO RETRIEVE DATA FROM OUR API
    
    func retrieveAllDataForModel(modelName: String) {
        
        // CANCEL AN EXISTING CONNECTION IF THERE IS ONE
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        // SHOW THAT THE NETWORK IS BUSY IN THE STATUS BAR
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        // SET UP THE SEARCH REQUEST
        let requestURL:NSURL = NSURL(string: "https://swapi.co/api/\(modelName)/?format=json")!
        
        // SET UP THE DATA RETRIEVAL TASK
        // USE A DIFFERENT COMPLETION HANDLER FOR EACH MODEL
        
        switch modelName {
            
        case "people":
            dataTask = defaultSession.dataTaskWithURL(requestURL, completionHandler: processRetrievedDataForPeople)
            
        case "films":
            dataTask = defaultSession.dataTaskWithURL(requestURL, completionHandler: processRetrievedDataForFilms)
            
            
        default:
            dataTask = nil
        }
        
        // START THE DATA RETRIEVAL
        dataTask?.resume()
        
    } // END retrieveAllDataForModel function
    
    
    
    func processRetrievedDataForPeople(data: NSData?, response: NSURLResponse?, error: NSError?) -> Void {
        
        // STOP THE UI ACTIVITY INDICATOR
        
        // CHECK DATA FOR ERRORS
        
        if let error = error {
            
            print("People data lookup error \(error.localizedDescription)")
            
        }
            
        // CHECK THE RESPONSE
        else if let httpResponse = response as? NSHTTPURLResponse {
        
            if httpResponse.statusCode == 200 {
        
        
                // PROCESS THE DATA
        
                do {
            
                    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            
                    // print(jsonData["results"])
                    
                    
                    // LOOP THROUGH THE RETRIEVED DATA AND CREATE A PERSON OBJECT FOR EACH ELEMENT OF THE JSON ARRAY
                    
                    if let retrievedPeople = jsonData["results"] as? [[String: AnyObject]] {
                        
                        var peopleArray = [Person]()
                        
                        for thisPerson in retrievedPeople {
                            
                            // CREATE A NEW INSTANCE OF PERSON
                            let newPerson = Person()
                            newPerson.name = thisPerson["name"] as? NSString
                            
                            
                            // ADD THE INSTANCE TO THE ARRAY
                            peopleArray.append(newPerson)
                            
                            print(newPerson.name!)
                            
                        } // END FOR LOOP
                        
                        // STORE THE RETRIEVED DATA
                        StarWarsDataStore.sharedInstance.allPeople = peopleArray
                        
                    }
            
                }
                catch {
                    print("Error serializing JSON: \(error)")
                }
                
                // POST NOTIFICATION THAT THE DATA HAS BEEN PROCESSED
                
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    NSNotificationCenter.defaultCenter().postNotificationName("PeopleDataRetrieved", object: self)
                    
                }
                
                
                
                
            }// END if httpResponse.statusCode ....
        }
    
}

    
    
    
    
    
    
    
    
    
    
func processRetrievedDataForFilms(data:NSData?, response:NSURLResponse?, error:NSError?) -> Void {
    
    // STOP THE UI ACTIVITY INDICATOR
    
    // CHECK DATA FOR ERRORS
    
    if let error = error {
        
        print("Film data lookup error \(error.localizedDescription)")
        
    }
        
        // CHECK THE RESPONSE
    else if let httpResponse = response as? NSHTTPURLResponse {
        
        if httpResponse.statusCode == 200 {
            
            
            // PROCESS THE DATA
            
            do {
                
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                
                // print(jsonData["results"])
                
                
                // LOOP THROUGH THE RETRIEVED DATA AND CREATE A PERSON OBJECT FOR EACH ELEMENT OF THE JSON ARRAY
                
                if let retrievedFilm = jsonData["results"] as? [[String: AnyObject]] {
                    
                    var filmArray = [Film]()
                    
                    for thisFilm in retrievedFilm {
                        
                        // CREATE A NEW INSTANCE OF PERSON
                        let newFilm = Film()
                        newFilm.title = thisFilm["title"] as? NSString
                        
                        
                        // ADD THE INSTANCE TO THE ARRAY
                        filmArray.append(newFilm)
                        
                        print(newFilm.title!)
                        
                    } // END FOR LOOP
                    
                    // STORE THE RETRIEVED DATA
                    StarWarsDataStore.sharedInstance.allFilms = filmArray
                    
                }
                
            }
            catch {
                print("Error serializing JSON: \(error)")
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                
                NSNotificationCenter.defaultCenter().postNotificationName("filmsDataRetrieved", object: self)
                
            }
        }
    }

}



}






