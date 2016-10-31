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
        
        let imageURL:URL? = URL(string: "http://handheldart.org/files/original/7b3438882572a8be9a03b87e1c7b23de.jpg")
        
        if imageURL != nil
        {
            //even though I initially named this "itemImage" it is actually a UIImageView, not a UIImage.
            itemImage.sd_setImage(with: imageURL)
            
            itemImage.contentMode = UIViewContentMode.scaleAspectFit

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
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    
        self.titleText.text = "Title: " + "Earl and Countess of Derby with Edward, their Infant Son, and Chaplain \nCreator: Benjamin Wilson (1721-1788) \nDate: 1777 \nSubject: Neoclassicism \nRights: Columbia Museum of Arts \nOriginal format: oil on canvas \nCitation: Benjamin Wilson (1721-1788), “Earl and Countess of Derby with Edward, their Infant Son, and Chaplain,” Handheld Art, accessed October 28, 2016, http://handheldart.org/items/show/17."

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
