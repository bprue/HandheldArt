//
//  OurTableViewController2.swift
//  HandheldArt
//
//  The Table View for the "Browse Enduring Ideas" page. Here, a call to the HHA takes all of the "tags" (which are actually Enduring Idea names) and automatically populates cells. Each cell's background image will be the first item from that Enduring Idea.
//  Created by CDH on 3/28/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import SwiftyJSON
import UIKit
//import SubViewController3.swift

class OurTableViewController2: UITableViewController {


    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var labels = [String: UILabel]()
    var strings = [String]()
    var objects = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //This gets the Enduring Idea names that will be used for cells
        let urlString = "http://handheldart.org/api/exhibit_pages/"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url, options: []) {
                let json = JSON(data: data)
                parseJSON(json)
            }
        }

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
            let id = result["id"].stringValue
            let tagURL = result["url"].stringValue
            let tagName = result["title"].stringValue
            let obj = ["id": id, "tagURL": tagURL, "tagName": tagName]
            //print (tagName)
            objects.append(obj)
        }
         tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Creates number of rows based on count of objects array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    
    //This is where the actual text is set for the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        let object = objects[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text =  object["tagName"]!
        
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "endIdeaSegue", sender: self)
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "endIdeaSegue"
        {
        
            let tabBarDestination = segue.destination as? EndIdeaTabBarController
        
            
                //goes to Nav Controller for EndIdeaDescription
                let endIdeaNav = tabBarDestination?.viewControllers?.first as! UINavigationController
            
                //Goes to EndIdeaDescription ViewController
                let endIdeaController = endIdeaNav.topViewController as! SubViewController3
            
                let endIdeaGalleryNav = tabBarDestination?.viewControllers?.last as! UINavigationController
            
                let endIdeaGalleryController = endIdeaGalleryNav.topViewController as! GalleryViewController
            
                if let myIndex = (tableView.indexPathForSelectedRow as NSIndexPath?)?.row
                {
                    let object = objects[myIndex]
                    let endIdeaName = object["tagName"]!
                    let endIdeaURL = object["tagURL"]!
                    endIdeaController.passName = endIdeaName
                    endIdeaController.passURL = endIdeaURL
                    
                    endIdeaGalleryController.passName = endIdeaName
                    endIdeaGalleryController.passURL = endIdeaURL
                }
            
        }
    }
    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//


    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
