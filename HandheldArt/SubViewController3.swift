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
    var range:Range<String.Index>!
    var range2:Range<String.Index>!
    var eittttDescText:String! //general description of Enduring Idea
    var subsections:String!
    var rationaleText:String! //rationale for teaching section
    var keyConceptsText:String! //key concepts section
    var essentialQText:String! //essetial questions section
    var valueToPass:String!
    @IBOutlet weak var EnduringIdeaTitle: UILabel!

    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var eitDescLabel: UILabel!
    @IBOutlet weak var rationaleLabel: UILabel!
    @IBOutlet weak var keyConcLabel: UILabel!
    @IBOutlet weak var essQLabel: UILabel!
    
    
    
    //var strings = [String]()
    var objects = [[String: String]]()
    var unitPlans = [[String: String]]()
    var descText:String!
    var descTextWHTML:String!
    var unitPlanFileURL:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = passURL
        

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
                
            for match in matches
            {
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
                if let url = URL(string: unitPlanFileURL!)
                {
                    if let data = try? Data(contentsOf: url, options: [])
                    {
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
                
                //removes all the HTML tags and such
                print ("Hey here is descTextWHTML 123")
                print (descTextWHTML)
                
                descText = descTextWHTML.stripHTML()
                descText = descText.removeBlanks()
                print ("Hey here is descText 456")
                print (descText)
                
                
                
                //In case there is information missing from an Enduring Idea page, we check for nil
                range = descText.range(of: "Unit Plans")
                if (range == nil)
                    {
                        eitDescLabel.text = "Coming soon!"
                        rationaleLabel.text = "Coming soon!"
                        keyConcLabel.text = "Coming soon!"
                        essQLabel.text = "Coming soon!"
                    
                    }
                //Otherwise, assume some information is there...
                else
                {
                
                    print ("Doing stuff under else")

                
                    /**
                     * Here, we basically want to split up descText (all the text, now without any HTML tags) into different sections, such as Unit Plans, Rationale for Teaching, Key Concepts, Essential Questions. To do this (because I don't want to do anything more complicated and ugly with the HTML) I'm just searching for those header phrases, then based on their indices, creating substrings of the different sections.
                     **/

                    //Find the range of the header phrase "Unit Plans" and get all of the text before that phrase. This is the initial Enduring Idea description.
                    range = descText.range(of: "Unit Plans")
                    var lower = range?.lowerBound
                    var upper = range?.upperBound
                    eittttDescText = descText.substring(to: lower!)
                    
                    //Next, going to get the text under the "Rationale for Teaching" section. Skipping the Unit Plans section because they're already present at the bottom of the page as links.
                    range = descText.range(of: "Rationale for Teaching")
                    upper = range?.upperBound
                    subsections = descText.substring(from: upper!)
                
                    //get range of "Essential Questions"
                    range = subsections.range(of: "Key Concepts")
                    lower = range?.lowerBound
                    upper = range?.upperBound
                
                    //get the rationale text
                    rationaleText = subsections.substring(to: lower!)
                
                    //get everything after "Key Concepts"
                    subsections = subsections.substring(from: upper!)
                    range = subsections.range(of: "Essential Questions")
                    lower = range?.lowerBound
                    upper = range?.upperBound
                    keyConceptsText = subsections.substring(to: lower!)
                
                    essentialQText = subsections.substring(from: upper!)
                    
                    //set ("Initial Description")
                    eitDescLabel.text = eittttDescText.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    
                    
                    //set ("Rationale for Teaching")
                    rationaleLabel.text = rationaleText.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    
                    //set ("Key Concepts")
                    keyConcLabel.text = keyConceptsText.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    
                    //set ("Essential Questions")
                    essQLabel.text = essentialQText.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                
                }
            }
            
     
            tableView.reloadData()

        }
        
        self.EnduringIdeaTitle.text = passName

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
    


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "openPDF")
        {
            let navController = segue.destination as! UINavigationController
           
            let vc = navController.topViewController as! UnitPlanViewController
            
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
let emptyReplaceString:String = "<p> </p>"

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
    
    func removeBlanks() -> String {
        return self.replacingOccurrences(of: "^\\s*", with: "", options: .regularExpression)
    }
    func stripHTML() -> String {
        return self.replacingOccurrences(of: htmlReplaceString, with: "", options: NSString.CompareOptions.regularExpression, range: nil)
    }
}
