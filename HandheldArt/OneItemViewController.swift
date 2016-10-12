//
//  OneItemViewController.swift
//  HandheldArt
//
//  Created by CDH on 3/28/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import UIKit
import AVFoundation

class OneItemViewController: UIViewController {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var titleText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageURL:NSURL? = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/d/d5/Pic_de_neige_cordier_Face_E.jpg")
        
        if imageURL != nil
        {
            //even though I initially named this "itemImage" it is actually a UIImageView, not a UIImage.
            itemImage.sd_setImageWithURL(imageURL)
            
            itemImage.contentMode = UIViewContentMode.ScaleAspectFit

           // AVMakeRectWithAspectRatioInsideRect(itemImage.image!.size, itemImage.bounds)
           
            /**
            let imageSize:CGSize = onScreenPointSizeOfImageInImageView(itemImage)
            var imageViewRect:CGRect = itemImage.frame
            imageViewRect.size = imageSize
            itemImage.frame = imageViewRect
             **/
        }
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    
        self.titleText.text = "Title: " + "Earl and Countess of Derby with Edward, their Infant Son, and Chaplain Mauris est odio, congue et commodo at, tristique sed metus. In at tristique urna. Aliquam et leo ante. Mauris sed fermentum justo. Aenean aliquet tellus eu leo malesuada, nec efficitur turpis dictum. Morbi neque risus, molestie non ligula ullamcorper, maximus fermentum ligula. Vivamus eget cursus est. Maecenas ac nulla malesuada, porta tortor quis, cursus nibh. In lobortis ac nunc nec rhoncus. Vestibulum sem lorem, mattis nec iaculis at, congue suscipit mi. Donec ut nibh id turpis blandit porta ac in nisi. Fusce sed leo tristique, rhoncus elit et, blandit libero. Sed cursus, lorem eu porttitor lacinia, sapien magna hendrerit nisi, quis malesuada lectus neque id turpis. Sed imperdiet elit magna, porta placerat tortor aliquam id. Donec ipsum nulla, scelerisque nec dolor pulvinar, facilisis sagittis lacus.  "

        // Do any additional setup after loading the view.
    }
    
    
    /**
   func onScreenPointSizeOfImageInImageView(imageV: UIImageView) -> CGSize {
        var scale: CGFloat
        if (imageV.frame.size.width > imageV.frame.size.height)
        {
            if (imageV.image!.size.width > imageV.image!.size.height)
            {
                scale = imageV.image!.size.height / imageV.frame.size.height
            }
            else
            {
                scale = imageV.image!.size.width / imageV.frame.size.width
            }
        }
        else
        {
            if (imageV.image!.size.width > imageV.image!.size.height)
            {
                scale = imageV.image!.size.width / imageV.frame.size.width
            }
            else
            {
                scale = imageV.image!.size.height / imageV.frame.size.height
            }
        }
        return CGSizeMake(imageV.image!.size.width / scale, imageV.image!.size.height / scale)
    }
    **/
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
