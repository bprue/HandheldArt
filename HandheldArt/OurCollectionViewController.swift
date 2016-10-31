//
//  OurCollectionViewController.swift
//  HandheldArt
//
//  Created by CDH on 3/28/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

//private let reuseIdentifier = "Cell"


class OurCollectionViewController: UICollectionViewController {
    var passName:String!
    var passURL:String!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    //setting up array for JSON stuff
    var labels = [String: UILabel]()
    var strings = [String]()
    var objects = [[String: String]]()
    
    var gallery = [[String: String]]()
    
    let tempPhotos = [UIImage(named: "thumbnail1.jpg"), UIImage(named: "thumbnail2.jpg"), UIImage(named: "thumbnail3.jpg"), UIImage(named: "thumbnail4.jpg"), UIImage(named: "thumbnail5.jpg"), UIImage(named: "thumbnail6.jpg")]
    
    
    override func viewDidLoad() {

        super.viewDidLoad()

        
        //for menu bar -- maybe replace with back button here.
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     

 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return tempPhotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
        UICollectionViewCell {
         

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GalleryViewCell
        
        cell.imageView?.image = self.tempPhotos[indexPath.row]
            
        cell.backgroundColor = UIColor.black
    
    
        return cell
    }
    


    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showSingleItem"
        {
            print ("********************")
            
            let vc = segue.destination as! GalleryItemViewController
            
            
            
            //let indexPaths = self.collectionView!.indexPathsForSelectedItems!
            
            //let indexPath = indexPaths[0] as NSIndexPath
            
            //vc.image = self.tempPhotos[indexPath.row]!
            
        }
    }

    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        print ("*******************")
        self.performSegue(withIdentifier: "showSingleItem", sender: indexPath.row)
        

    }
    
    // MARK: UICollectionViewDelegate



}
