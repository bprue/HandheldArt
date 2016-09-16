//
//  SubViewController.swift
//  HandheldArt
//  This is the main page (home page).
//
//  Created by CDH on 3/25/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SubViewController: UIViewController {

    
    @IBOutlet weak var menuButton: UIBarButtonItem!    

    @IBOutlet weak var HHAdescription: UILabel!
    @IBOutlet weak var itemDayLabel: UILabel!
    @IBOutlet weak var itemOTDtitle: UILabel!
    @IBOutlet weak var itemOTDcreator: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print ("hellooo")
//        // Do any additional setup after loading the view, typically from a nib.
//        Alamofire.request(.GET, "http://handheldart.org/api/tags/").responseJSON { (response) -> Void in
//            
//            if let value = response.result.value {
//                let json = JSON(value)
//                print(json)
//            }
//        }
        

        

    
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.HHAdescription.text = "Handheld Art is a virtual learning environment for the classroom, encouraging interdisciplinary study by merging art and the humanities for K-12 education. Handheld Art is revolutionizing how the humanities are taught in the classroom, organizing content knowledge in a creative way to support larger ideas known as Enduring Ideas. Partnered with the Columbia Museum of Art and the Gibbes Museum of Art, Handheld Art allows K-12 educators to access, create, and manage lesson plans with corresponding art collections for a whole new way of learning."
        self.itemDayLabel.text = "Item of the Day!"
        self.itemOTDtitle.text = "Earl and Countess of Derby with Edward, their Infant Son, and Chaplain"
        self.itemOTDcreator.text = "Benjamin Wilson (1721-1788)"

        // Do any additional setup after loading the view.
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
