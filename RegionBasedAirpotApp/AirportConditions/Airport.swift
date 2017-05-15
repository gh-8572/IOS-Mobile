//
//  Airport.swift
//  AirportConditions
//
//  Created by RobElliott on 9/13/16.
//  Copyright © 2016 RobElliott. All rights reserved.
//

import Foundation

class Airport: NSObject {
    
    var airportName: String?
    var airportCode: String?
    var city: String?
    var state: String?
    var country: String?
    var latitude: Double?
    var longitude: Double?
    var windSpeed: Double?
    var windGusts: Double?
    var weatherConditions: String?
    var temperature: Int?
    
    
    
    init(airportName: String, airportCode: String, city: String, state: String, country: String, latitude: Double, longitude: Double, windSpeed: Double, windGusts: Double, weatherConditions: String, temperature: Int) {
        self.airportName = airportName
        self.airportCode = airportCode
        self.city = city
        self.state = state
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.windSpeed = windSpeed
        self.windGusts = windGusts
        self.weatherConditions = weatherConditions
        self.temperature = temperature
    }
    
}