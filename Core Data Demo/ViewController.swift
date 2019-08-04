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
        
    }
}

