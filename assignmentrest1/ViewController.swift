//
//  ViewController.swift
//  assignmentrest1
//
//  Created by admin on 10/02/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
import SwiftyJSON
import SVGKit
import Foundation
import CoreData
struct bindstruct {
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

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
let newdata: NSMutableArray = []
    @IBOutlet weak var srchbar: UISearchBar!
    var arrdatalocal:String = ""
    var arrdata = [bindstruct]()
    var arrcoredata = [bindstruct]()
    var searchcountry = [bindstruct]()
    var searchcoredata = [bindstruct]()
    var searching = false
    var serchingcore =  false
    var index1: Int = 0
    var index2: Int = 0
    var onlineoffline = true  // true for online and false for offline data showing
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tblview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.srchbar.delegate = self
        tblview.rowHeight = 60
        getalldata()
    }
    override func viewWillAppear(_ animated: Bool)
    {
          self.tblview.reloadData()

    }
    func getdata1(value: String){
        arrdata.removeAll()
        
        Alamofire.request("https://restcountries.eu/rest/v2/name/"+value).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                for ind in 0..<swiftyJsonVar.count
                {
                    var str1 =   swiftyJsonVar[ind]["name"]
                    var str2 =   swiftyJsonVar[ind]["flag"]
                    var str3 =   swiftyJsonVar[ind]["capital"]
                    var str4 =   swiftyJsonVar[ind]["region"]
                    var str5 =   swiftyJsonVar[ind]["subregion"]
                    var str6 =   swiftyJsonVar[ind]["callingCodes"][0]
                    var str7 =   swiftyJsonVar[ind]["timezones"][0]
                    var str8 =   swiftyJsonVar[ind]["currencies"][0]["name"]
                    var str9 =   swiftyJsonVar[ind]["nativeName"]
                    var str10 =  swiftyJsonVar[ind]["languages"][0]["name"]
                    self.arrdata.append(bindstruct( name: str1.stringValue, flag: str2.stringValue, capital: str3.stringValue, region: str4.stringValue, subregion: str5.stringValue, callingcode: str6.stringValue, timezone: str7.stringValue, currencies: str8.stringValue, nativename: str9.stringValue, language: str10.stringValue))
                    self.tblview.reloadData()
                }
               
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
     if(onlineoffline == true)
     {
//          if (searching == true)
//           {
//                return searchcountry.count
//           }
//           else
//           {
                return arrdata.count
//           }
       
      }
        else
      {
           if (serchingcore == true)
           {
              return searchcoredata.count
           }
           else
           {
             return arrcoredata.count
           }
        
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTableViewCell", for: indexPath) as! CountriesTableViewCell
        cell.selectionStyle = .none
        
        if(onlineoffline ==  true)
        {
//            if (searching == true)
//            {
//                cell.lblCountries.text = searchcountry[indexPath.row].name
//                let url = searchcountry[indexPath.row].flag
//                let imageURL:URL=URL(string: url)!
//                let datam = NSData(contentsOf: imageURL)
//                let anSVGImage: SVGKImage = SVGKImage(data: datam as Data?)
//                cell.imgCountries.image = anSVGImage.uiImage
//                return cell
//            }
//            else
//            {
            
                cell.lblCountries.text = arrdata[indexPath.row].name
                let url = arrdata[indexPath.row].flag
                let imageURL:URL=URL(string: url)!
                let datam = NSData(contentsOf: imageURL)
                let anSVGImage: SVGKImage = SVGKImage(data: datam as Data?)
                cell.imgCountries.image = anSVGImage.uiImage
                return cell
//            }
        }
        else
        {
            if (serchingcore == true)
            {
                cell.lblCountries.text = searchcoredata[indexPath.row].name
                let url = searchcoredata[indexPath.row].flag
                let imageURL:URL=URL(string: url)!
                let datam = NSData(contentsOf: imageURL)
                let anSVGImage: SVGKImage = SVGKImage(data: datam as Data?)
                cell.imgCountries.image = anSVGImage.uiImage
                return cell
            }
            else
            {
                cell.lblCountries.text = arrcoredata[indexPath.row].name
                let url = arrcoredata[indexPath.row].flag
                let imageURL:URL=URL(string: url)!
                let datam = NSData(contentsOf: imageURL)
                let anSVGImage: SVGKImage = SVGKImage(data: datam as Data?)
                cell.imgCountries.image = anSVGImage.uiImage
                return cell
            }
            
        }
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        if(onlineoffline == true)
        {
//             if (searching == true)
//            {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "detailviewViewController") as! detailviewViewController
//            vc.name = searchcountry[indexPath.row].name
//            vc.capital =  searchcountry[indexPath.row].capital
//            vc.region = searchcountry[indexPath.row].region
//            vc.subregion = searchcountry[indexPath.row].subregion
//            vc.callingcode = searchcountry[indexPath.row].callingcode
//            vc.timezoe = searchcountry[indexPath.row].timezone
//            vc.currencies = searchcountry[indexPath.row].currencies
//            vc.language = searchcountry[indexPath.row].language
//            vc.nativename = searchcountry[indexPath.row].nativename
//            vc.flag = searchcountry[indexPath.row].flag
//            self.navigationController?.pushViewController(vc, animated: true)
//           }
//           else
//           {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "detailviewViewController") as! detailviewViewController
            vc.name = arrdata[indexPath.row].name
            vc.capital = arrdata[indexPath.row].capital
            vc.region = arrdata[indexPath.row].region
            vc.subregion = arrdata[indexPath.row].subregion
            vc.callingcode = arrdata[indexPath.row].callingcode
            vc.timezoe = arrdata[indexPath.row].timezone
            vc.currencies = arrdata[indexPath.row].currencies
            vc.language = arrdata[indexPath.row].language
            vc.nativename = arrdata[indexPath.row].nativename
            vc.flag = arrdata[indexPath.row].flag
            self.navigationController?.pushViewController(vc, animated: true)
//           }
        }
        else
        {
            if (serchingcore == true)
            {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "detailviewViewController") as! detailviewViewController
                vc.name = searchcoredata[indexPath.row].name
                vc.capital =  searchcoredata[indexPath.row].capital
                vc.region = searchcoredata[indexPath.row].region
                vc.subregion = searchcoredata[indexPath.row].subregion
                vc.callingcode = searchcoredata[indexPath.row].callingcode
                vc.timezoe = searchcoredata[indexPath.row].timezone
                vc.currencies = searchcoredata[indexPath.row].currencies
                vc.language = searchcoredata[indexPath.row].language
                vc.nativename = searchcoredata[indexPath.row].nativename
                vc.flag = searchcoredata[indexPath.row].flag
                vc.btnonline = false
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else
            {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "detailviewViewController") as! detailviewViewController
                vc.name = arrcoredata[indexPath.row].name
                vc.capital = arrcoredata[indexPath.row].capital
                vc.region = arrcoredata[indexPath.row].region
                vc.subregion = arrcoredata[indexPath.row].subregion
                vc.callingcode = arrcoredata[indexPath.row].callingcode
                vc.timezoe = arrcoredata[indexPath.row].timezone
                vc.currencies = arrcoredata[indexPath.row].currencies
                vc.language = arrcoredata[indexPath.row].language
                vc.nativename = arrcoredata[indexPath.row].nativename
                vc.flag = arrcoredata[indexPath.row].flag
                vc.btnonline = false
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        
    }
    func getalldata()
    {
        var arrprofile = [Person]()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        do{
            arrprofile = try context.fetch(fetchrequest) as! [Person]
            for item in arrprofile {
                let str1 = item.value(forKey: "name") as! String
                let str2 = item.value(forKey: "flag")  as! String
                let str3 = item.value(forKey: "capital")  as! String
                let str4 = item.value(forKey: "region")  as! String
                let str5 = item.value(forKey: "subregion")  as! String
                let str6 = item.value(forKey: "currency")  as! String
                let str7 = item.value(forKey: "timezones")  as! String
                let str8 = item.value(forKey: "callingcode")  as! String
                let str9 = item.value(forKey: "language")  as! String
                let str10 = item.value(forKey: "nativename")  as! String
                self.arrcoredata.append(bindstruct( name: str1, flag: str2, capital: str3, region: str4, subregion: str5, callingcode: str6, timezone: str7, currencies: str8, nativename: str9, language: str10))
            }
           
        }
        catch let error{
            print(error.localizedDescription)
        }
       
    }
    @IBAction func btnonlineoffline(_ sender: Any) {
        if(segment.selectedSegmentIndex == 0)
        {
              onlineoffline =  true
              tblview.reloadData()
        }
        else
        {
             onlineoffline = false
             tblview.reloadData()
            
        }
    }
    
}
extension ViewController:UISearchBarDelegate
{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searching = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searching = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searching = false;
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searching = false;
    }


    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
 //   tblview.isHidden = false
    if(onlineoffline == true)
    {
        guard let query = searchBar.text, query.trimmingCharacters(in: .whitespaces) != "" else {
            
            print("nothing to search")
            return
        }
        print(query)
        getdata1(value: query)
      //  self.tblview.reloadData()
      

        
        
        
//        if searchText.count == 0
//        {  searching = false;
//           self.tblview.reloadData()
//        } else
//        {
//
//                searchcountry = arrdata.filter({ (bindstruct) -> Bool in
//                let tmp: NSString = bindstruct.name as NSString
//                let range = tmp.range(of:searchText, options: NSString.CompareOptions.caseInsensitive)
//                return range.location != NSNotFound
//            })
//            if(searchcountry.count == 0){
//                searching = false;
//            } else {
//                searching = true;
//            }
//            self.tblview.reloadData()
//        }
       

      }
        else
      {
        
        if searchText.count == 0 {
            serchingcore = false;
            self.tblview.reloadData()
        } else {
            searchcoredata = arrcoredata.filter({ (bindstruct) -> Bool in
                let tmp: NSString = bindstruct.name as NSString
                let range = tmp.range(of:searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
            if(searchcoredata.count == 0){
                serchingcore = false;
            } else {
                serchingcore = true;
            }
            self.tblview.reloadData()


           }
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        if(onlineoffline == true)
        {
           searching = false
           srchbar.text = ""
           tblview.reloadData()
        }
        else
        {
            serchingcore = false
            srchbar.text = ""
            tblview.reloadData()
        }
    }

}
