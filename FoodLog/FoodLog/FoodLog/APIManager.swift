
//
//  apiManager.swift
//  FoodLog
//
//  Created by smith, eric jay on 11/30/16.
//  Copyright © 2016 RobElliott. All rights reserved.
//

import UIKit


class APIManager: NSObject {
    
    // VARIABLES
    let apiAppID = "aeaf2d54"
    let apiAppKey = "3ae3486167ec1d17f630f4ecf49b7f9a"
    let apiURL = "https://trackapi.nutritionix.com/v2/natural/nutrients"
    let apiURL2 = "https://api.nutritionix.com/v1_1/item?upc="
    
    
    
    // MAKE THIS CLASS A SINGLETON
    static let sharedInstance = APIManager()
    
    // OBJECT FOR SENDING AND RECEIVING HTTP REQUESTS
    let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    // A NSURLSessionDataTask TO EXECUTE A "GET" REQUEST AND RETRIEVE DATA INTO MEMORY
    var dataTask: NSURLSessionDataTask?
    
    
    // FUNCTION TO RETRIEVE DATA FROM OUR API via POST
    
    
    func retrieveAllDataFromAPI(searchTerm: String) {
        
        // Setup the session to make REST POST call
        let url = NSURL(string: apiURL)!
        let postParams : [String: AnyObject] = ["query": searchTerm]
        
        // Create the request
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue(apiAppID, forHTTPHeaderField: "x-app-id")
        request.setValue(apiAppKey, forHTTPHeaderField: "x-app-key")
        request.setValue("0", forHTTPHeaderField: "x-remote-user-id")
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(postParams, options: NSJSONWritingOptions())
            print(postParams)
        } catch {
            print("bad things happened")
        }
        
        
        
        // Make the POST call and handle it in a completion handler
        defaultSession.dataTaskWithRequest(request, completionHandler: processRetrievedAPIData).resume()
        
    }
    
    
    func processRetrievedAPIData(data: NSData?, response: NSURLResponse?, error: NSError?) -> Void{
        print("In completionhandler")
        
        print(response)
        
        // STOP THE UI ACTIVITY INDICATOR
        dispatch_async(dispatch_get_main_queue()) {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
        
        // CHECK DATA FOR ERRORS
        
        if let error = error {
            
            print("Food lookup error \(error.localizedDescription)")
            
        }
            
            // CHECK THE RESPONSE
        else if let httpResponse = response as? NSHTTPURLResponse {
            
            if httpResponse.statusCode == 200 {
                
                
                
                
                
                // PROCESS THE DATA
                
                do {
                    
                    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    
                    print(jsonData["foods"])
                    
                    
                    if let retrievedFoodItems = jsonData["foods"] as? [[String: AnyObject]] {
                        
                        var foodArray = [FoodItem]()
                        
                        for thisFoodItem in retrievedFoodItems{
                            
                            let newFood = FoodItem()
                            newFood.foodName = thisFoodItem["food_name"] as! String!
                            newFood.brandName = thisFoodItem["brand_name"] as! String!
                            newFood.calories = thisFoodItem["nf_calories"] as! Double!
                            newFood.cholesterol = thisFoodItem["nf_cholesteral"] as! Double!
                            newFood.consumeDate = thisFoodItem["consume_date"] as! NSTimeInterval!
                            newFood.dietaryFiber = thisFoodItem["nf_dietary_fiber"] as! Double!
                            newFood.photoThumb = thisFoodItem["photo_thumb"] as! NSObject!
                            newFood.potassium = thisFoodItem["nf_potassium"] as! Double!
                            newFood.protein = thisFoodItem["nf_protein"] as! Double!
                            newFood.saturatedFat = thisFoodItem["nf_saturated_fat"] as! Double!
                            newFood.servingQuantity = thisFoodItem["serving_qty"] as! Double!
                            newFood.servingUnit = thisFoodItem["serving_unit"] as! Double!
                            newFood.servingWeightGrams = thisFoodItem["serving_weight_grams"] as! Double!
                            newFood.sodium = thisFoodItem["nf_sodium"] as! Double!
                            newFood.sugar = thisFoodItem["nf_sugars"] as! Double!
                            newFood.totalCarbs = thisFoodItem["nf_total_carbohydrate"] as! Double!
                            newFood.totalFat = thisFoodItem["nf_total_fat"] as! Double!
                            newFood.upc = thisFoodItem["upc"] as! String!
                            newFood.photoURL = thisFoodItem["photo_url"] as! String!
                            
                            
                            
                            
                            foodArray.append(newFood)
                            
                            print(newFood.foodName!)
                            
                        }
                        
                        foodItemDataStore.sharedInstance.foodItems = foodArray
                    }
                    
                }
                    
                    
                    
                    
                catch {
                    print("Error serializing JSON: \(error)")
                }
                
                // POST NOTIFICATION THAT THE DATA HAS BEEN PROCESSED
                
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    NSNotificationCenter.defaultCenter().postNotificationName("FoodDataRetrieved", object: self)
                    
                }
                
                
                
                
                
                
            }// END ELSE IF let httpResponse...
            
        }
        
        /*  func processRetrievedAPIData2(data: NSData?, response: NSURLResponse?, error: NSError?) -> Void{
         print("In completionhandler")
         
         if let error = error {
         print("UPC data lookup error \(error.localizedDescription)")
         }
         else if let httpResponse = response as? NSHTTPURLResponse {
         
         if httpResponse.statusCode == 200 {
         
         do {
         let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: . AllowFragments)
         
         if let retrivedFood = jsonData["foodItem"] as? [[String: AnyObject]] {
         
         
         }
         }
         }
         }
         
         */
        
    }
    
}



