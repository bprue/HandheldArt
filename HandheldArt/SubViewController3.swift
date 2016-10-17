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

class SubViewController3: UIViewController {
    var passName:String!
    var passURL:String!
    @IBOutlet weak var EnduringIdeaTitle: UILabel!
    @IBOutlet weak var EnduringIdeaDesc: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var KeyConcepts: UILabel!
    @IBOutlet weak var EssentialQs: UILabel!
    
    var labels = [String: UILabel]()
    var strings = [String]()
    var objects = [[String: String]]()
    var descText:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = passURL
        print (urlString)
        if let url = NSURL(string: urlString) {
            if let data = try? NSData(contentsOfURL: url, options: []) {
                let json = JSON(data: data)
                
                let pageBlocks = json["page_blocks"].arrayValue
                let pageBlock = pageBlocks.first
                descText = pageBlock!["text"].stringValue
                
                print(descText)
                
                
                    
                
              
                
                
                /**
                if let id = json["id"] as? [[[String: AnyObject]]
                {
                    print(id)
                }**/
                /**
                
                for result in json.arrayValue {
                    let id = result["id"].stringValue
                    print (id)
                    let pageBlocks = result["page_blocks"].arrayValue
                    
                    let firstPageBlock = pageBlocks.first
                    
                    descText = firstPageBlock!["text"].stringValue
                    print(descText)
                }
 **/
            }
        }

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        // Do any additional setup after loading the view.
        
        self.EnduringIdeaTitle.text = passName
        
        //let object = objects[0]
        self.EnduringIdeaDesc.text = descText
        
        self.KeyConcepts.text = "• Perceptions/Misperceptions of aging are varied \n• Changes associated with aging are tangible and intangible \n• Milestones/Rituals associated with aging"
        
        self.EssentialQs.text = "• How is aging portrayed in culture? \n• In what ways are changes evident? \n•What rituals are often associated aging?"
        
    
    }
    
    /**
    func parseJSON(json: JSON) {
        for result in json.arrayValue {
            //let _ = result["id"].stringValue
            //let _ = result["url"].stringValue
            //let _ = result["title"].stringValue
            
            let pageBlocks = result["page_blocks"].arrayValue
            
            let firstPageBlock = pageBlocks.first
            
            let descText = firstPageBlock!["text"].stringValue
            
            let obj = ["Desc" : descText]
            //print (tagName)
            objects.append(obj)
        }
        
        
        //tableView.reloadData()
    }**/
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
