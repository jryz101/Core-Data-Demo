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
        newUser.setValue("Captain", forKey: "username")
        newUser.setValue("myPass", forKey: "password")
        newUser.setValue(35, forKey: "age")
        
        
        //Do try catch construction block for saving context | Save default values above
        do {
            
            try context.save()
            print("Saved")
            
        }catch{
            
            print("There was an error")
        }
        
        
        //A description of search criteria used to retrieve data from a persistent store | Retrieve data from core data model
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        //A Boolean value that indicates whether the objects resulting from a fetch request are faults
        request.returnsObjectsAsFaults = false
        
        
        //Do try catch construction block for fetching data from core data
        do{
            
            let results = try context.fetch(request)
            
            //Conditional methods to check the results value whether is greater than 0
            if results.count > 0 {
                
                //For in loop construction for casting the results into A generic class that implements all the basic behavior required of a Core Data model object
                for result in results as! [NSManagedObject] {
                    
                    //Retrieve username value from core data and casting into String value
                    if let username = result.value(forKey : "username") as? String {
                        
                        print(username)
                        
                    }
                    
                }
                
            }else{
                
                print("No Result")
            }
            
        }catch{
            
                print("Couldn't Fetch Results")
        }
    }
}

