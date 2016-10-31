//
//  SubViewController.swift
//  HandheldArt
//  View Controller for the Home Page, which users land on after loading application. 
//  At the very top is a description of the application and the HHA project.
//  Beneath this will be an "Item of the Day" randomly pulled from a collection. The title and creator will be displayed, along with a button to navigate to the full page about that item.
//
//  Created by CDH on 3/25/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import UIKit
//import Alamofire
//import SwiftyJSON

class SubViewController: UIViewController {

    
    @IBOutlet weak var menuButton: UIBarButtonItem!  //menu button
    @IBOutlet weak var HHAdescription: UILabel!
    @IBOutlet weak var itemDayLabel: UILabel!
    @IBOutlet weak var itemOTDtitle: UILabel!
    @IBOutlet weak var itemOTDcreator: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Reveals left-side navigation menu
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.HHAdescription.text = "Handheld Art is a virtual learning environment for the classroom, encouraging interdisciplinary study by merging art and the humanities for K-12 education. Handheld Art is revolutionizing how the humanities are taught in the classroom, organizing content knowledge in a creative way to support larger ideas known as Enduring Ideas. Partnered with the Columbia Museum of Art and the Gibbes Museum of Art, Handheld Art allows K-12 educators to access, create, and manage lesson plans with corresponding art collections for a whole new way of learning."
        self.itemDayLabel.text = "Item of the Day!"
        self.itemOTDtitle.text = "Earl and Countess of Derby with Edward, their Infant Son, and Chaplain"
        self.itemOTDcreator.text = "Benjamin Wilson (1721-1788)"


    }

}
