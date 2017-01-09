//
//  PopUpViewController.swift
//  HandheldArt
//
//  Created by Elizabeth Pruett on 1/9/17.
//  Copyright © 2017 CDH. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController, UIScrollViewDelegate {
    
    var myImageURL:URL!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.sd_setImage(with: myImageURL)

        self.scrollView.minimumZoomScale = 1.0
        
        self.scrollView.maximumZoomScale = 6.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func closePopUp(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}
