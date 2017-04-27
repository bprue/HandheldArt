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


    @IBAction func backButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.sd_setImage(with: myImageURL)

        self.scrollView.minimumZoomScale = 1.0
        
        self.scrollView.maximumZoomScale = 6.0
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))

        
        
        imageView.addGestureRecognizer(longPressRecognizer)
    }

    
    func longPressed(sender: UILongPressGestureRecognizer) {
        //have pop up that says copy or save photo
        
        
        let alertController = UIAlertController(title: "Handheld Art", message:
            "Save image to device?", preferredStyle: UIAlertControllerStyle.alert)
        let alertActionOkay = UIAlertAction(title: "Save", style: .default) { (_) in UIImageWriteToSavedPhotosAlbum(self.imageView.image!, nil, nil, nil)
        }
        let alertActionCancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(alertActionOkay)
        alertController.addAction(alertActionCancel)
        

        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}
