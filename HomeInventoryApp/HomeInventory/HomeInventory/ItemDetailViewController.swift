//
//  ItemDetailViewController.swift
//  HomeInventory
//
//  Created by smith, eric jay on 11/9/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    var selectedItem: Item!
    
    
    @IBOutlet weak var lblDisplayItemName: UILabel!
    
    
    @IBOutlet weak var lblDisplayPurchaseDate: UILabel!
    
    
    @IBOutlet weak var lblDisplayPurchasePrice: UILabel!
    
    
    @IBOutlet weak var lblDisplaySeriaNumber: UILabel!
    
    
    @IBOutlet weak var lblDisplayCategory: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = (selectedItem.itemName)
        
        
        lblDisplayItemName.text = selectedItem.itemName
        
        lblDisplayPurchaseDate.text = "\(selectedItem.purchaseDate)"
        
        lblDisplayPurchasePrice.text = "\(selectedItem.purchasePrice!)"
        
        lblDisplaySeriaNumber.text = selectedItem.serialNumber
        
        lblDisplayCategory.text = selectedItem.category?.categoryName
    }
    
}