//
//  DetailViewController.swift
//  ikeaFinder
//
//  Created by smith, eric jay on 9/28/16.
//  Copyright © 2016 smith, eric jay. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    
    var thisIKEA: IKEA!
    
    
    @IBOutlet weak var labelName: UILabel!
    
    
    
    @IBOutlet weak var labelCity: UILabel!
    
    
    
    @IBOutlet weak var imageStore: UIImageView!
    
    
    
    override func viewWillAppear(animated: Bool) {
        print(thisIKEA.name)
        
        //Write information to the labels and image
        
        labelName.text = thisIKEA.name
        labelCity.text = thisIKEA.city
        
        
        let ikeaImage = thisIKEA.storeImage
        
        
        imageStore.image = UIImage(named:ikeaImage)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "mapView" {
            let mapVC = segue.destinationViewController as! mapViewController
            
            mapVC.mappedIKEA = thisIKEA
            
            self.navigationItem.title = thisIKEA.name
        }
    }
    
}


