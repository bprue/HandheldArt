//
//  AboutPageViewController.swift
//  HandheldArt
//
//  Created by Elizabeth Pruett on 2/23/17.
//  Copyright © 2017 CDH. All rights reserved.
//

import UIKit

class AboutPageViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = "Handheld Art is a virtual learning environment for the classroom, encouraging interdisciplinary study by merging art and the humanities for K-12 education. \n \n The Handheld Art Project is supported by grants from: \n\n The University of South Carolina Provost Initiative \nThe Columbia Museum of Art \nThe National Art Education Association \nThe University of South Carolina Center for Digital Humanities \n\nFor more information, please visit http://handheldart.cas.sc.edu"
        // Do any additional setup after loading the view.
        
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
    



}
