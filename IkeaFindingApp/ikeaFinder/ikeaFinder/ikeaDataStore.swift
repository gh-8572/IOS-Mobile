//
//  ikeaDataStore.swift
//  ikeaFinder
//
//  Created by smith, eric jay on 9/26/16.
//  Copyright © 2016 smith, eric jay. All rights reserved.
//

import UIKit

class ikeaDataStore {
    
    // Needed to make this a singleton
    
    static let sharedInstance = ikeaDataStore()
    
    var allIKEAs = [IKEA]()
    
    
    private init() {
        
     //populate our array of Ikea objects

        // CODE TO INSTANTIATE IKEA OBJECTS
        
        let brooklyn = IKEA(name: "IKEA Brooklyn", city: "New York", state: "NY", smalland: true, storeImage: "ikea_brooklyn", latitude: 40.699381, longitude: -74.008026)
        
        let elizabeth = IKEA(name: "IKEA Elizabeth", city: "New York", state: "NY", smalland: true, storeImage: "ikea_elizabeth", latitude: 40.708751, longitude: -74.160461)
        
        let emeryville = IKEA(name: "IKEA Emeryville", city: "San Francisco", state: "CA", smalland: false, storeImage: "ikea_emeryville", latitude: 37.839615, longitude: -122.291908)
        
        let westChester = IKEA(name: "IKEA West Chester", city: "Cincinnati", state: "OH", smalland: true, storeImage: "ikea_westchester", latitude: 39.315185, longitude: -84.4365427)
        
        let canton = IKEA(name: "IKEA Canton", city: "Detroit", state: "MI", smalland: false, storeImage: "ikea_canton", latitude: 42.325405, longitude: -83.4536457)
        
        let tempe = IKEA(name: "IKEA Tempe", city: "Tempe", state: "AZ", smalland: false, storeImage: "ikea_tempe", latitude: 33.340943, longitude: -111.9727367)
        
        let burbank = IKEA(name: "IKEA Burbank", city: "Burbank", state: "CA", smalland: true, storeImage: "ikea_burbank", latitude: 34.187144, longitude: -118.311906)
        
        let carson = IKEA(name: "IKEA Carson", city: "Carson", state: "CA", smalland: false, storeImage: "ikea_carson", latitude: 33.841788, longitude: -118.2624887)
        
        let sanDiego = IKEA(name: "IKEA San Diego", city: "San Diego", state: "CA", smalland: false, storeImage: "ikea_sandiego", latitude: 32.78004, longitude: -117.1285917)
        
        let calleAltoDelRetiro = IKEA(name: "IKEA Calle Alto del Retiro", city: "Madrid", state: "", smalland: true, storeImage: "ikea_madrid", latitude: 40.369648, longitude: -3.5980487)
        
        let tottenham = IKEA(name: "IKEA Tottenham", city: "London", state: "", smalland: false, storeImage: "ikea_tottenham", latitude: 51.6291, longitude: -0.049438)
        
        let wembley = IKEA(name: "IKEA Wembley", city: "London", state: "", smalland: false, storeImage: "ikea_wembley", latitude: 51.572802, longitude: -0.255432)
        
        let alexandra = IKEA(name: "IKEA Alexandra", city: "Singapore", state: "", smalland: false, storeImage: "ikea_alexandra", latitude: 1.2880126, longitude: 103.8038386)
        
        let tampines = IKEA(name: "IKEA Tampines", city: "Singapore", state: "", smalland: true, storeImage: "ikea_tampines", latitude: 1.3741008, longitude: 103.9301652)
        
        let cairo = IKEA(name: "IKEA Cairo Festival City", city: "Cairo", state: "", smalland: true, storeImage: "ikea_cairo", latitude: 24.628117, longitude: 32.949199)
        
        let wunderbrunnen = IKEA(name: "IKEA Wunderbrunnen", city: "Hamburg", state: "", smalland: true, storeImage: "ikea_hamburg", latitude: 53.6489358, longitude: 9.9259277)
        
        
        allIKEAs = [brooklyn, elizabeth, emeryville, westChester, canton, tempe, burbank, carson, sanDiego, calleAltoDelRetiro, tottenham, wembley, alexandra, tampines, cairo, wunderbrunnen]
    }
    
    
    
    
}
