//
//  detailviewViewController.swift
//  assignmentrest1
//
//  Created by admin on 10/02/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SVGKit
import Foundation
import CoreData

struct  infostruct {
    let name:String
    let flag: String
    let capital:String
    let region:String
    let subregion:String
    let callingcode:String
    let timezone:String
    let currencies:String
    let nativename:String
    let language:String
}
class detailviewViewController: UIViewController {
let employee: NSMutableArray = []
    let dictdata:NSMutableDictionary = [:]
    var newdata = [infostruct]()
    @IBOutlet weak var lblcountry: UILabel!
    @IBOutlet weak var lblcapital: UILabel!
    @IBOutlet weak var lblregions: UILabel!
    @IBOutlet weak var lblsubregions: UILabel!
    @IBOutlet weak var lblcallingcodes: UILabel!
    @IBOutlet weak var lbltimezones: UILabel!
    @IBOutlet weak var lblcurrencies: UILabel!
    @IBOutlet weak var lbllanguage: UILabel!
    @IBOutlet weak var lblnativename: UILabel!
    @IBOutlet weak var lmgflag: UIImageView!
    @IBOutlet weak var btnsaveoutlet: UIButton!
    
    var name: String!
    var capital: String!
    var region: String!
    var subregion: String!
    var callingcode:String!
    var timezoe: String!
    var currencies: String!
    var language:String!
    var nativename: String!
    var flag: String!
    var btnonline: Bool!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblcountry.text  = name
        lblcapital.text  = capital
        lblregions.text = region
        lblsubregions.text = subregion
        lblcallingcodes.text = callingcode
        lbltimezones.text  = timezoe
        lblcurrencies.text = currencies
        lbllanguage.text = language
        lblnativename.text = nativename
        let url = flag!
        let imageURL:URL=URL(string: url)!
        let datam = NSData(contentsOf: imageURL)
        let anSVGImage: SVGKImage = SVGKImage(data: datam as Data?)
        lmgflag.image = anSVGImage.uiImage
        if(btnonline ==  false)
        {
            btnsaveoutlet.isHidden = true
        }
        else
        {
            btnsaveoutlet.isHidden = false
        }
        
 
    }
    
    @IBAction func btnsave(_ sender: Any) {
        
        self.newdata.append(infostruct( name: name, flag: flag, capital: capital, region: region, subregion: subregion, callingcode: callingcode, timezone: timezoe, currencies: currencies, nativename: nativename, language: language))
        dictdata["name"] = name
        dictdata["capital"]  = capital
        dictdata["flag"] = flag
        dictdata["region"]  = region
        dictdata["subregion"] = subregion
        dictdata["callingcode"]  = callingcode
        dictdata["timezoe"] = timezoe
        dictdata["currencies"]  = currencies
        dictdata["nativename"] = nativename
        dictdata["language"]  = language
        print(dictdata)
        employee.add(name!)
        employee.add(capital!)
        employee.add(region!)
        employee.add(subregion!)
        employee.add(callingcode!)
        employee.add(timezoe!)
        employee.add(currencies!)
        employee.add(language!)
        employee.add(nativename!)
        employee.add(flag!)
        print(employee)
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let profile = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as! Person
            profile.name = name
            profile.capital = capital
            profile.currency = currencies
            profile.language = language
            profile.flag = flag
            profile.callingcode = callingcode
            profile.region = region
            profile.subregion = subregion
            profile.nativename = nativename
            profile.timezones = timezoe
            do{
                try context.save()
            }
            catch let error{
                print(error.localizedDescription)
            }
        
        let alert  = UIAlertController(title: "SAVE DATA FOR OFFLINE", message: "Data saved successfully!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
      }
    
}
