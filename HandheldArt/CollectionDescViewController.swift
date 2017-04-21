//
//  CollectionDescViewController.swift
//  HandheldArt
//  View controller for a single Collection's description page.
//  Created by Elizabeth Pruett on 11/2/16.
//  Copyright © 2016 CDH. All rights reserved.
//


// Icons from https://icons8.com/license/

import UIKit
import SwiftyJSON
import Alamofire
import Foundation

class CollectionDescViewController: UIViewController {
    var passName:String!
    var passURL:String!
    @IBOutlet weak var EnduringIdeaTitle: UILabel!
    @IBOutlet weak var EnduringIdeaDesc: UILabel!


    var descText:String!
    var descTextWHTML:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.EnduringIdeaTitle.text = passName

        self.EnduringIdeaDesc.text = descText
        

  
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

