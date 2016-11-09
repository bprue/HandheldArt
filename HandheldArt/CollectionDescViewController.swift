//
//  CollectionDescViewController.swift
//  HandheldArt
//  View controller for a single Collection's description page.
//  Created by Elizabeth Pruett on 11/2/16.
//  Copyright © 2016 CDH. All rights reserved.
//


// Icons from https://icons8.com/license/

import UIKit
import SwiftyJSON
import Alamofire
import Foundation

class CollectionDescViewController: UIViewController {
    var passName:String!
    var passURL:String!
    @IBOutlet weak var EnduringIdeaTitle: UILabel!
    @IBOutlet weak var EnduringIdeaDesc: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var labels = [String: UILabel]()
    var strings = [String]()
    var objects = [[String: String]]()
    var descText:String!
    var descTextWHTML:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = passURL
        print (urlString)
        
        
        /**
        if let url = URL(string: urlString!) {
            if let data = try? Data(contentsOf: url, options: []) {
                let json = JSON(data: data)
                
                let pageBlocks = json["page_blocks"].arrayValue
                let pageBlock = pageBlocks.first
                descTextWHTML = pageBlock!["text"].stringValue
                
                //parse out the HTML tags
                descText = descTextWHTML.stripHTML()
                
                
                
            }
        }
        **/
        
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
            // Do any additional setup after loading the view.
            
            self.EnduringIdeaTitle.text = passName
            
            //let object = objects[0]
            self.EnduringIdeaDesc.text = descText
            
            
            
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
         **/
        
        //tableView.reloadData()
    }
    
    
    
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

