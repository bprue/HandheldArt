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
    @IBAction func downloadImage(_ sender: UIButton) {
        UIImageWriteToSavedPhotosAlbum(galleryItemImageView.image!, nil, nil, nil)
        
        let alertController = UIAlertController(title: "Handheld Art", message:
            "Image saved to device!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
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
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popUpSegue"
        {
            let vc = segue.destination as! PopUpViewController
            
            vc.myImageURL = passImageURL
        }

    }

    //Creates array 'objects' based on the desired components of the JSON data - which is acquired above from the URL
    
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

}
