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
    var dataForCellsNotLoaded:Bool = true

    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print ("View Did Appear *************")

        if (dataForCellsNotLoaded)
        {
            let urlString = passURL
        
            parseJson(urlString: urlString!)
        
            getImageURLs(objects: objects)
        
            collectionView.reloadData()
            
            dataForCellsNotLoaded = false
        }
    }
    
    
    func parseJson(urlString: String)
    {
        print ("PARSING JSON!")
        if let url = URL(string: urlString)
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
        
    }
    func getImageURLs(objects: [[String: String]])
    {
        print ("GETTING IMAGE URLS")
        for obj in objects
        {
            
            let fURL = obj["fileURL"]
            print ("IM HERE!!")
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
                    
                    let itemURL = json["item"]["url"].URL
                    
                    let galObj = ["originalURL" : originalURL, "thumbnailURL" : thumbnailURL, "itemURL" : itemURL]
                    
                    gallery.append(galObj as! [String : URL])
                }
            }
        }
        
        print ("GETIMAGEURLS GALLERY COUNT IS ")
        print (gallery.count)
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        print ("activityIndicator removed from SuperView")
        
        //collectionView.reloadData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print ("GALLERY COUNT IS ")
        print (gallery.count)
        return gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print ("SETTING CELL IMAGE")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GalleryCollCell
        
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
            
            vc.passImageURL = gallery[indexPath.row]["originalURL"]
            
            vc.passItemURL = gallery[indexPath.row]["itemURL"]
            
            print("%%%%%%")
            print(gallery[indexPath.row]["itemURL"])
            
        }
    }
    

    


}
