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
        //Currently, it gets anything under the "text" key- but we will only want the names of collections..
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    //Creates array 'objects' based on the desired components of the JSON data - which is acquired above from the URL
    func parseJSON(_ json: JSON) {
        
        for result in json.arrayValue {
            //gets collection ID
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
                    let obj = ["id": givenID, "itemsURL": itemsURL, "text": givenText]
                    objects.append(obj)
                }

            }
            

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


//
//    // MARK: - Table view data source
//
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
