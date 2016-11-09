//
//  GalleryItemViewController.swift
//  HandheldArt
//
//  Created by Elizabeth Pruett on 10/27/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import UIKit

class GalleryItemViewController: UIViewController {
    
    var passImageURL:URL!
    

    @IBOutlet weak var galleryItemImageView: UIImageView!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        galleryItemImageView.sd_setImage(with: passImageURL)
        
        //collectionItemImageView.sd_setImage(with: passImageURL)
        //self.galleryItemImageView.image = self.image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
