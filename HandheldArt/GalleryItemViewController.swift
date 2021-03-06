//
//  GalleryItemViewController.swift
//  HandheldArt
//
//  Created by Elizabeth Pruett on 10/27/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import UIKit
import SwiftyJSON

class GalleryItemViewController: UIViewController {
    
    var passImageURL:URL!
    var passItemURL:URL!
    
    var allMetadata:String! = ""
    

    @IBOutlet weak var galleryItemImageView: UIImageView!
    
    
    @IBOutlet weak var metadata: UILabel!

    
    var image = UIImage()
    var objects = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        galleryItemImageView.sd_setImage(with: passImageURL)
        
        if let data = try? Data(contentsOf: passItemURL, options: []) {
        
            print("Going to parse json")

                
            let json = JSON(data: data)
                
            parseJSON(json)
        
            metadata.text = allMetadata + "\n\n"

        
        
            print("Final text should be")
            print(allMetadata)
                
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        galleryItemImageView.isUserInteractionEnabled = true
        galleryItemImageView.addGestureRecognizer(tapGestureRecognizer)
        
        
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        performSegue(withIdentifier: "popUpSegue", sender: self)
        
        // Your action
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popUpSegue"
        {
            
            let navCont = segue.destination as! UINavigationController
            
            let vc = navCont.topViewController as! PopUpViewController
           
            vc.myImageURL = passImageURL
        }

    }

    //Creates array 'objects' based on the desired components of the JSON data - which is acquired above from the URL
    
    func parseJSON(_ json: JSON) {
        
        print("In parseJSON function")
        
        
        let itemType = json["item_type"]["name"].stringValue
        
        print(itemType)
        print("$$$")
        
        let tags = json["tags"].arrayValue
        
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
        
        let elementTexts = json["element_texts"].arrayValue
        
        var metadataStuff = [[String: String]]()
        
        for elem in elementTexts
        {
            //text such as image's title, creator
            let itemTex = elem["text"].stringValue
            
            print("itemTex:")
            print(itemTex)
            
            //describes the above text (says whether it is a title, date)
            let textType = elem["element"]["name"].stringValue
            
            print("textType")
            print(textType)
            
            if (textType != "Source" && textType != "Identifier")
            {
            let meta = ["textType" : textType, "itemTex" : itemTex]
            
            
            allMetadata = allMetadata + textType + ": " + itemTex + "\n"
            
            metadataStuff.append(meta)
            }
        }
        

        
    }

}
