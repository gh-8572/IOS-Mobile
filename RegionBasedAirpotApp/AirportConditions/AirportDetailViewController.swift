//
//  ViewController.swift
//  AirportConditions
//
//  Created by RobElliott on 9/13/16.
//  Copyright © 2016 RobElliott. All rights reserved.
//

import UIKit

class AirportDetailViewController: UIViewController {
    
    // ATTRIBUTES and IBOutlets

    var activeAirport: Airport!
    
    @IBOutlet var lblAirportCode: UILabel!
    @IBOutlet var lblAirportName: UILabel!
    @IBOutlet var lblWeatherConditions: UILabel!
    @IBOutlet var lblTemperature: UILabel!
    @IBOutlet var lblCity: UILabel!
    @IBOutlet var lblState: UILabel!
    @IBOutlet var lblCountry: UILabel!
    @IBOutlet var lblLatitude: UILabel!
    @IBOutlet var lblLongitude: UILabel!
    @IBOutlet var lblWindSpeed: UILabel!
    @IBOutlet var lblWindGusts: UILabel!
    
    
    
    // IBActions
    
    
    
    
    
    // CUSTOM METHODS
    
    
    
    
    
    // EVENT LIFECYCLE METHODS
    
    
    
    override func viewWillAppear(animated: Bool) {
        
        // SET THE ACTIVE AIRPORT HERE (temporarily)

        // SAN DIEGO
        self.activeAirport = Airport(airportName: "Toronto Pearson International Airport", airportCode: "YYZ", city: "Toronto", state: "ON", country: "USA", latitude: 43.6777176, longitude: -79.6270084, windSpeed: 5.0, windGusts: 17.0, weatherConditions: "Sunny", temperature: 75)
        
        
        
        // WRITE INFORMATION ABOUT THE ACTIVE AIRPORT TO THE SCREEN
        lblAirportCode.text = activeAirport.airportCode
        lblAirportName.text = activeAirport.airportName
        lblWeatherConditions.text = activeAirport.weatherConditions
        lblTemperature.text = "\(activeAirport.temperature!)"
        lblCity.text = activeAirport.city
        lblState.text = activeAirport.state
        lblCountry.text = activeAirport.country
        lblLatitude.text = "\(activeAirport.latitude!)"
        lblLongitude.text = "\(activeAirport.longitude!)"
        lblWindSpeed.text = "\(activeAirport.windSpeed!)"
        lblWindGusts.text = "\(activeAirport.windGusts!)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

