//
//  ViewNutritionDetailViewController.swift
//  FoodLog
//
//  Created by Rust, Matthew Carlton on 11/28/16.
//  Copyright © 2016 RobElliott. All rights reserved.
//

import UIKit

class ViewNutritionDetailViewController: UIViewController {
    
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblBrandName: UILabel!
    @IBOutlet weak var lblServingQuantityUnit: UILabel!
    @IBOutlet weak var lblServingWeight: UILabel!
    @IBOutlet weak var lblCalories: UILabel!
    @IBOutlet weak var lblFat: UILabel!
    @IBOutlet weak var lblSaturatedFat: UILabel!
    @IBOutlet weak var lblCarbs: UILabel!
    @IBOutlet weak var lblSodium: UILabel!
    @IBOutlet weak var lblCholesterol: UILabel!
    @IBOutlet weak var lblDietaryFiber: UILabel!
    @IBOutlet weak var lblSugar: UILabel!
    @IBOutlet weak var lblProtein: UILabel!
    @IBOutlet weak var lblPotassium: UILabel!

    var selectedFoodItem: FoodItem!
    
    override func viewDidLoad() {
        
        self.title = "Nutrition Details";
    
        lblFoodName.text = selectedFoodItem.foodName
        lblBrandName.text = selectedFoodItem.brandName
        lblServingQuantityUnit.text = "\(selectedFoodItem.servingQuantity) \(selectedFoodItem.servingUnit)"
        lblServingWeight.text = "\(selectedFoodItem.servingWeightGrams) Grams"
        lblCalories.text = String(selectedFoodItem.calories)
        lblFat.text = String(selectedFoodItem.totalFat)
        lblSaturatedFat.text = String(selectedFoodItem.saturatedFat)
        lblCarbs.text = String(selectedFoodItem.totalCarbs)
        lblSodium.text = String(selectedFoodItem.sodium)
        lblCholesterol.text = String(selectedFoodItem.cholesterol)
        lblDietaryFiber.text = String(selectedFoodItem.dietaryFiber)
        lblSugar.text = String(selectedFoodItem.sugar)
        lblProtein.text = String(selectedFoodItem.protein)
        lblPotassium.text = String(selectedFoodItem.potassium)
        
    }
    
}






 