//
//  GalleryViewController.swift
//  HandheldArt
//
//  Created by Elizabeth Pruett on 10/27/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import UIKit
import SwiftyJSON

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var passName:String!
    var passURL:String!
    var objects = [[String: String]]()
    var gallery = [[String: URL]]()

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let tempPhotos = [UIImage(named: "thumbnail1.jpg"), UIImage(named: "thumbnail2.jpg"), UIImage(named: "thumbnail3.jpg"), UIImage(named: "thumbnail4.jpg"), UIImage(named: "thumbnail5.jpg"), UIImage(named: "thumbnail6.jpg")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //in here is getting file urls and such from API -- fix later...
        
         
         let urlString = passURL
         print (urlString)
        
         if let url = URL(string: urlString!) 
         {
            if let data = try? Data(contentsOf: url, options: []) 
            {
                let json = JSON(data: data)
         
                let pageBlocks = json["page_blocks"].arrayValue
         
                let pageBlock = pageBlocks.last
         
                let attachments = pageBlock!["attachments"].arrayValue
         
                for attachment in attachments
                {
                    //get id, item url, and file url
         
                    let id = attachment["id"].stringValue
         
                    //print(id)
                   // print ("**********")
         
                    //let itemURL = attachment["item"]["url"].stringValue
         
                    let fileURL = attachment["file"]["url"].stringValue
         
         
                    let obj = ["id": id, "fileURL": fileURL]
         
                    objects.append(obj)
                }
            }
         }
        
        getImageURLs(objects: objects)
        //call getImageURLS function
        

        // Do any additional setup after loading the view.
    }

    
    func getImageURLs(objects: [[String: String]])
    {
        for obj in objects
        {
            
            
            let fURL = obj["fileURL"]
            print (fURL)
            
            if let xurl = URL(string: fURL!)
            {
                if let data = try? Data(contentsOf: xurl, options: [])
                {
                    let json = JSON(data: data)
                    
                    
                    let originalURL = json["file_urls"]["original"].URL
                    
                   // print(originalURL)
                    //print("************")
                    
                    let thumbnailURL = json["file_urls"]["square_thumbnail"].URL
                    
                    
                    let galObj = ["originalURL" : originalURL, "thumbnailURL" : thumbnailURL]
                    
                    gallery.append(galObj as! [String : URL])
                }
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GalleryCollCell
        
            //cell.imageView.image = self.tempPhotos[indexPath.row]
        
            let imgURL = gallery[indexPath.row]["thumbnailURL"]
        
        print ("***")
            cell.imageView.sd_setImage(with: imgURL)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showSingleItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSingleItem"
        {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems!
            
            let indexPath = indexPaths[0] as! NSIndexPath
            
            let vc = segue.destination as! GalleryItemViewController
            
            //vc.image = self.tempPhotos[indexPath.row]!
            
            
        }
    }

}
