//  ViewController.swift
//  Core Data Demo
//  Created by Jerry Tan on 05/08/2019.
//  Copyright © 2019 Starknet Technologies®. All rights reserved.


import UIKit
import CoreData

class ViewController: UIViewController {
    
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Casting the delegate of the app object to AppDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //The managed object context associated with the main queue. (read-only) | Access core database methods
        let context = appDelegate.persistentContainer.viewContext
        
        //Creates, configures, and returns an instance of the class for the entity with a given name
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        
        
        //Sets the property of the receiver specified by a given key to a given value.
        newUser.setValue("Leonado", forKey: "username")
        newUser.setValue("myPass", forKey: "password")
        newUser.setValue(35, forKey: "age")
        
        
        //Do try catch construction block for saving context | Save default values above
        do {
            
            try context.save()
            print("Saved")
            
        }catch{
            
            print("There was an error")
        }
        
    }
}

