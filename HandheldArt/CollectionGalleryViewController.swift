//
//  CollectionGalleryViewController.swift
//  HandheldArt
//
//  Created by Elizabeth Pruett on 11/2/16.
//  Copyright © 2016 CDH. All rights reserved.
//



import UIKit
import SwiftyJSON

class CollectionGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var passName:String!
    var passURL:String!
    var objects = [[String: String]]()
    var gallery = [[String: URL]]()
    var dataForCellsNotLoaded:Bool = true
    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating();

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print ("View Did Appear *************")
        
        if (dataForCellsNotLoaded)
        {
            let urlString = passURL
            
            print("HOOPLAH")
            print(passURL)
            
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
                
                for result in json.arrayValue
                {
                    let itemID = result["id"].stringValue
                    let itemURL = result["url"].stringValue
                    let filesURL = result["files"]["url"].stringValue

                
                    let obj = ["itemID": itemID, "itemURL": itemURL, "filesURL": filesURL]
                    objects.append(obj)
                }
            }
        }
        
    }
    func getImageURLs(objects: [[String: String]])
    {

        
        var obj = objects[0]
        for index in 0...5
        //for obj in objects
        {
            
            obj = objects[index]
            let fURL = obj["filesURL"]
            print ("IM HERE!!")
            print (fURL)
            
            if let xurl = URL(string: fURL!)
            {
                if let data = try? Data(contentsOf: xurl, options: [])
                {
                    let json = JSON(data: data)
                    
                    for result in json.arrayValue
                    {
                    
                    let originalURL = result["file_urls"]["original"].URL
                    
                    print(originalURL)
                    print("************")
                    
                    let thumbnailURL = result["file_urls"]["square_thumbnail"].URL
                        
                    
                    let galObj = ["originalURL" : originalURL, "thumbnailURL" : thumbnailURL]
                    
                     gallery.append(galObj as! [String : URL])
                    }
                }
            }
        }
        
        print ("GETIMAGEURLS GALLERY COUNT IS ")
        print (gallery.count)
        activityIndicator.stopAnimating();
        
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
        
        //cell.imageView.image = self.tempPhotos[indexPath.row]
        
        let imgURL = gallery[indexPath.row]["thumbnailURL"]
        
        print ("***")
        cell.imageView.sd_setImage(with: imgURL)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print ("doing stuff here as well")
        self.performSegue(withIdentifier: "showCollectionItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showCollectionItem"
        {
            print ("doing this here")
            let indexPaths = self.collectionView!.indexPathsForSelectedItems!
            
            let indexPath = indexPaths[0] as! NSIndexPath
            
            let vc = segue.destination as! CollGalleryItemViewController
            
            vc.passImageURL = gallery[indexPath.row]["originalURL"]
            
            vc.passItemURL = objects[indexPath.row]["itemURL"] 
            

            
            
        }
    }
    
}
