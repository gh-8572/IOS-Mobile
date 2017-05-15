//
//  AddRoomViewController.swift
//  HomeInventory
//
//  Created by Rob Elliott on 10/18/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit

class AddRoomViewController: UIViewController {
    
    var selectedProperty: Property!
    
    @IBOutlet var txtRoomName: UITextField!
    
    @IBOutlet weak var txtFloorNumber: UITextField!
    
    
    @IBAction func btnAddRoom(sender: AnyObject) {
        
        Room.addRoom(txtRoomName.text!,selectedProperty: selectedProperty, floor: txtFloorNumber.text!)
        
        
        navigationController?.popViewControllerAnimated(true)
    }
    
}