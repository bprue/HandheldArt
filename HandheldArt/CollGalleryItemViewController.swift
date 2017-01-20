//
//  CollGalleryItemViewController.swift
//  HandheldArt
//
//  Created by Elizabeth Pruett on 11/2/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import UIKit
import SwiftyJSON

class CollGalleryItemViewController: UIViewController {
    
    var passImageURL:URL!
    var passItemURL:String!
    var allMetadata:String! = ""

    @IBOutlet weak var collectionItemImageView: UIImageView!
    
    @IBOutlet weak var metadata: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print ("DOING THIS TWICE")

    collectionItemImageView.sd_setImage(with: passImageURL)
        
        let myURL = URL(string: passItemURL)
        
        if let data = try? Data(contentsOf: myURL!, options: []) {
            
            print("Going to parse json")
            
            
            let json = JSON(data: data)
            
            parseJSON(json)
            
            metadata.text = allMetadata
            
            
            print("Final text should be")
            print(allMetadata)
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    func parseJSON(_ json: JSON) {
        
        print("In parseJSON function")
        
        
        var itemType = json["item_type"]["name"].stringValue
        
        print(itemType)
        print("$$$")
        
        var tags = json["tags"].arrayValue
        
        var allTags = [[String: String]]()
        
        for tag in tags
        {
            let tagName = tag["name"].stringValue
            
            print("tagName:")
            print(tagName)
            
            let tagURL = tag["url"].stringValue
            
            print("tagURL:")
            print(tagURL)
            let oneTag = ["tagName": tagName, "tagURL": tagURL]
            
            allTags.append(oneTag)
            
        }
        
        var elementTexts = json["element_texts"].arrayValue
        
        var metadataStuff = [[String: String]]()
        
        for elem in elementTexts
        {
            //text such as image's title, creator
            var itemTex = elem["text"].stringValue
            
            print("itemTex:")
            print(itemTex)
            
            //describes the above text (says whether it is a title, date)
            var textType = elem["element"]["name"].stringValue
            
            print("textType")
            print(textType)
            
            let meta = ["textType" : textType, "itemTex" : itemTex]
            
            
            allMetadata = allMetadata + textType + ": " + itemTex + "\n"
            
            metadataStuff.append(meta)
        }
        
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popUpSegue"
        {
            let vc = segue.destination as! PopUpViewController
            
            vc.myImageURL = passImageURL
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
