//
//  mapViewController.swift
//  ikeaFinder
//
//  Created by smith, eric jay on 10/3/16.
//  Copyright © 2016 smith, eric jay. All rights reserved.
//

import UIKit


class mapViewController: UIViewController  {
    
    var mappedIKEA: IKEA!
    
    override func viewWillAppear(animated: Bool) {
        
        navigationItem.title = "\(mappedIKEA.name)"
        
    }
    

}

