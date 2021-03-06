//
//  OurTableViewController.swift
//  HandheldArt
//  Table View Controller for "Browse Collections" page. Here, call to the HHA API automatically populates each cell with the name of a collection stored in Handheld Art. Each cell will have the background image of the first item in that collection.
//
//  Created by CDH on 3/25/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import SwiftyJSON
import UIKit

class OurTableViewController: UITableViewController {


    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var labels = [String: UILabel]()
    var strings = [String]()
    var objects = [[String: String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /***/
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //This gets the Collection names that will be used for cells

        let urlString = "http://handheldart.org/api/collections/"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url, options: []) {
                let json = JSON(data: data)
                parseJSON(json)
            }
        }
        /***/
        
        
        //Reveals left-side navigation menu
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }


    }
    
    //Creates array 'objects' based on the desired components of the JSON data - which is acquired above from the URL
    func parseJSON(_ json: JSON) {
        
        for result in json.arrayValue {
            //gets collection ID
            
            var givenTitle:String!
            var givenDesc:String!
            let givenID = result["id"].stringValue

            //gets url of all items in 
            let itemsURL = result["items"]["url"].stringValue
            
            let element_texts = result["element_texts"].arrayValue
            
            for element in element_texts {
                let _ = element["html"].stringValue
                let givenText = element["text"].stringValue
                let elementType = element["element"]["name"].stringValue
                
                //checks to make sure the text we are getting is the title of a collection
                if (elementType == "Title")
                {
                    givenTitle = givenText
                }
                if (elementType == "Description")
                {
                    givenDesc = givenText
                }

            }
            
            let obj = ["id": givenID, "itemsURL": itemsURL, "text": givenTitle, "desc": givenDesc]
            objects.append(obj as! [String : String])
            

        }

        tableView.reloadData()
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Creates number of rows based on count of objects array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(objects.count)
        return objects.count
    }
    
    
    //This is where the actual text is set for the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        let object = objects[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text =  object["text"]!
        
        cell.backgroundColor = UIColor.clear
        
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "collectionSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "collectionSegue"
        {
            
            let tabBarDestination = segue.destination as? CollectionTabBarController
            
            
            //goes to Nav Controller for Collection Description
            let collectionNav = tabBarDestination?.viewControllers?.first as! UINavigationController
            
            //Goes to EndIdeaDescription ViewController
            let collectionController = collectionNav.topViewController as! CollectionDescViewController
            
            let collectionGalleryNav = tabBarDestination?.viewControllers?.last as! UINavigationController
            
            let collGalleryController = collectionGalleryNav.topViewController as! CollectionGalleryViewController
            
            if let myIndex = (tableView.indexPathForSelectedRow as NSIndexPath?)?.row
            {
                let object = objects[myIndex]
                let endIdeaName = object["text"]!
                let endIdeaURL = object["itemsURL"]!
                collectionController.passName = endIdeaName
                collectionController.passURL = endIdeaURL
                
                collectionController.descText = object["desc"]!
                
                collGalleryController.passName = endIdeaName
                collGalleryController.passURL = endIdeaURL
                
                
            }
            
        }
    }
//


}
