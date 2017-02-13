//
//  SubViewController3.swift
//  HandheldArt
//
//  Created by CDH on 3/28/16.
//  Copyright © 2016 CDH. All rights reserved.
//


// Icons from https://icons8.com/license/

import UIKit
import SwiftyJSON
import Alamofire
import Foundation

class SubViewController3: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var passName:String!
    var passURL:String!
    var valueToPass:String!
    @IBOutlet weak var EnduringIdeaTitle: UILabel!
    @IBOutlet weak var EnduringIdeaDesc: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //var strings = [String]()
    var objects = [[String: String]]()
    var unitPlans = [[String: String]]()
    var descText:String!
    var descTextWHTML:String!
    var unitPlanFileURL:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = passURL
        print("weensaw")
        print (urlString)
        

        if let url = URL(string: urlString!) {
            if let data = try? Data(contentsOf: url, options: []) {
                let json = JSON(data: data)
                
                let pageBlocks = json["page_blocks"].arrayValue
                let pageBlock = pageBlocks.first
                descTextWHTML = pageBlock!["text"].stringValue

                //parse out the HTML tags
                
                /**
                * Searches the entire HTML tagged text for url (will get the unit plan urls)
                */
                let types: NSTextCheckingResult.CheckingType = .link
                let detector = try? NSDataDetector(types: types.rawValue)
                guard let detect = detector else {
                    return
                }
                
                let matches = detect.matches(in: descTextWHTML, options: .reportCompletion, range: NSMakeRange(0, descTextWHTML.characters.count))
                
                for match in matches {
                    print("sup")
                    print(match.url!)
                    
                    //here, want to grab the item number for each unit plan...so need to convert match.url! to string??
                    
                    let path:String = match.url!.path
                    let index = path.index(path.startIndex, offsetBy: 12)
                    let itemNumber:String = path.substring(from: index)

                    print(itemNumber)
                    
                    //now need to go to http://handheldart.cas.sc.edu/api/files?item=itemNumber
                    
                    unitPlanFileURL = "http://handheldart.cas.sc.edu/api/files?item=" + itemNumber
                    
                    //since there may be more than one, need to collect em all 
                    if let url = URL(string: unitPlanFileURL!) {
                        if let data = try? Data(contentsOf: url, options: []) {
                            let json = JSON(data: data)
                            
                            for result in json.arrayValue
                            {
                                print("HARRY POTER")
                                let pdfURL = result["file_urls"]["original"].stringValue
                                let unitPlanName = result["original_filename"].stringValue
                                
                                let unitP = ["planName": unitPlanName, "pdfURL": pdfURL]
                                unitPlans.append(unitP)
                                
                            }
                        }
                    }
                    
                    
                }
                
                
                //removes all the tags and such
                descText = descTextWHTML.stripHTML()

            }
            
            
            tableView.reloadData()

        }
        

        /**
         * Code for the lefthand navigation bar
        */
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
      
        
            self.EnduringIdeaTitle.text = passName
        
            //let object = objects[0]
            self.EnduringIdeaDesc.text = descText
    
        }

    }
    
    
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print ("hooplah!!")
        print (unitPlans.count)
        return unitPlans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eiCell", for: indexPath)
        
        let uPlan = unitPlans[indexPath.row]
        cell.textLabel?.text = uPlan["planName"]
        
        return cell
    }
    

    /**
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eiCell", for: indexPath)
        
        let uPlan = unitPlans[indexPath.row]
        valueToPass = uPlan["pdfURL"]
        print("chips1")
        print(valueToPass)
        
        //(withIdentifier: "openPDF", sender: self)
        
    }**/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        if (segue.identifier == "openPDF")
        {
            let vc = segue.destination as! UnitPlanViewController
            
            let selectedRow = tableView.indexPathForSelectedRow!.row
            
            let uPlan = unitPlans[selectedRow]
            
            valueToPass = uPlan["pdfURL"]
        
            print("chips2")
            print(valueToPass)
            vc.myURLString = valueToPass
        }
    }

}





/**
 The html replacement regular expression
 */

let htmlReplaceString   :   String  =   "<[^>]+>"

extension NSString {
    /**
     Takes the current NSString object and strips out HTML using regular expression. All tags get stripped out.
     
     :returns: NSString html text as plain text
     */
    
    
    func stripHTML() -> NSString {

        
        return self.replacingOccurrences(of: htmlReplaceString, with: "", options: NSString.CompareOptions.regularExpression, range: NSRange(location: 0,length: self.length)) as NSString
    }
}

extension String {
    /**
     Takes the current String struct and strips out HTML using regular expression. All tags get stripped out.
     
     :returns: String html text as plain text
     */
    func stripHTML() -> String {
        return self.replacingOccurrences(of: htmlReplaceString, with: "", options: NSString.CompareOptions.regularExpression, range: nil)
    }
}
