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
    var loadedItems = Set<String>()
    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (dataForCellsNotLoaded)
        {
            let urlString = passURL
            
            parseJson(urlString: urlString!)
            
            //getImageURLs(objects: objects)
            
            collectionView.reloadData()
            
            dataForCellsNotLoaded = false
        }
        
        activityIndicator.stopAnimating();
    }
    
    /** Parses json information to get item ids and urls
     **/
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
    
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GalleryCollCell
        
        
        
        let obj = objects[indexPath.row]
        let fURL = obj["filesURL"]
        
        if (!loadedItems.contains(fURL!))
        {
            if let xurl = URL(string: fURL!)
            {
                if let data = try? Data(contentsOf: xurl, options: [])
                {
                    let json = JSON(data: data)
                    for result in json.arrayValue
                    {
                        
                        print("hey im taking forever")
                        
                        let originalURL = result["file_urls"]["original"].URL
                        
                        let thumbnailURL = result["file_urls"]["square_thumbnail"].URL
                        
                        let galObj = ["originalURL" : originalURL, "thumbnailURL" : thumbnailURL]
                        
                        gallery.append(galObj as! [String : URL])
                        loadedItems.insert(fURL!)
                    }
                }
            }
        }
        
    
        let imgURL = gallery[indexPath.row]["thumbnailURL"]
        
        cell.imageView.sd_setImage(with: imgURL, placeholderImage: UIImage(named: "hhahand"))
        
       // cell.imageView.sd_setImage(with: imgURL)
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print ("doing stuff here as well")
        self.performSegue(withIdentifier: "showSingleItem", sender: self)
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSingleItem"
        {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems!
            
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destination as! GalleryItemViewController
            
            vc.passImageURL = gallery[indexPath.row]["originalURL"]
            
            vc.passItemURL = URL(string: objects[indexPath.row]["itemURL"]!)
            
        }
    }
    
}
