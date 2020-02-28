//
//  DatabaseHelper.swift
//  assignmentrest1
//
//  Created by admin on 11/02/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static let instance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func savedata(at profiledata:String){
        let profile = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as! Person
             profile.name = profiledata
       
        do{
            try context.save()
        }
        catch let error{
            print(error.localizedDescription)
        }
    }
    func getalldata() -> [Person] {
        var arrprofile = [Person]()
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        do{
            arrprofile = try context.fetch(fetchrequest) as! [Person]
        }
        catch let error{
            print(error.localizedDescription)
        }
        return arrprofile
    }
    
  
    
}

