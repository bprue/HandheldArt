//
//  CollGalleryItemViewController.swift
//  HandheldArt
//
//  Created by Elizabeth Pruett on 11/2/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import UIKit

class CollGalleryItemViewController: UIViewController {
    
    var passImageURL:URL!


    @IBOutlet weak var collectionItemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print ("DOING THIS TWICE")

        collectionItemImageView.sd_setImage(with: passImageURL)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
