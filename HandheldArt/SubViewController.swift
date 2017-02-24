//
//  SubViewController.swift
//  HandheldArt
//  View Controller for the Home Page, which users land on after loading application. 
//  At the very top is a description of the application and the HHA project.
//  Beneath this will be an "Item of the Day" randomly pulled from a collection. The title and creator will be displayed, along with a button to navigate to the full page about that item.
//
//  Created by CDH on 3/25/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import UIKit
//import Alamofire
import SwiftyJSON

class SubViewController: UIViewController {

    var imageUR:String!
    var imageURL:URL!
    @IBOutlet weak var menuButton: UIBarButtonItem!  //menu button
    @IBOutlet weak var HHAdescription: UILabel!
    @IBOutlet weak var itemDayLabel: UILabel!
    @IBOutlet weak var itemOTDtitle: UILabel!
    @IBOutlet weak var itemOTDcreator: UILabel!

    @IBOutlet weak var imageOfDay: UIImageView!
    
    var fullItemURL:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Reveals left-side navigation menu
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            

            
            let urlString = "http://handheldart.cas.sc.edu/api/files"
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url, options: []) {
                    let json = JSON(data: data)
                    parseJSON(json)
                }
            }
            
            imageURL = URL(string: imageUR)
            if imageURL != nil
            {
                //even though I initially named this "itemImage" it is actually a UIImageView, not a UIImage.
                imageOfDay.sd_setImage(with: imageURL)
                
                imageOfDay.contentMode = UIViewContentMode.scaleAspectFit
                
            }
        }
        
        self.HHAdescription.text = "Handheld Art is a virtual learning environment for the classroom, encouraging interdisciplinary study by merging art and the humanities for K-12 education. Handheld Art is revolutionizing how the humanities are taught in the classroom, organizing content knowledge in a creative way to support larger ideas known as Enduring Ideas. Partnered with the Columbia Museum of Art and the Gibbes Museum of Art, Handheld Art allows K-12 educators to access, create, and manage lesson plans with corresponding art collections for a whole new way of learning."
        self.itemDayLabel.text = "Random Item!"



    }
    
    func parseJSON(_ json: JSON) {
        
        let numberOfItems = json.arrayValue.count
        
        let x = Int(arc4random_uniform(UInt32(numberOfItems)) + 1)
        
        let itemOfDay = json.arrayValue[x]
        
        imageUR = itemOfDay["file_urls"]["original"].stringValue
        
        fullItemURL = itemOfDay["item"]["url"].stringValue
        
        if let thisurl = URL(string: fullItemURL) {
            if let data = try? Data(contentsOf: thisurl, options: []) {
                let json2 = JSON(data: data)
                getBasicData(json2)
            }
        }
        
    }
    
    func getBasicData(_ json: JSON)
    {
        let jsonelements = json["element_texts"].arrayValue
        
        print ("Whatup guys")
        
        for elems in jsonelements
        {
            let elemText = elems["text"].stringValue
            let elemType = elems["element"]["name"].stringValue
            
            if (elemType == "Title")
            {
                itemOTDtitle.text = "Title: " + elemText
            }
            if (elemType == "Creator")
            {
                itemOTDcreator.text = "Creator: " + elemText
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewMoreSegue"
        {

            
            let vc = segue.destination as! GalleryItemViewController
            
            vc.passImageURL = imageURL
            
            vc.passItemURL = URL(string: fullItemURL)
            

            
        }
    }

}
