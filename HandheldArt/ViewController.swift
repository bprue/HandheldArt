//
//  ViewController.swift
//  HandheldArt
//
//  Created by CDH on 3/25/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print ("hellooo")
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request(.GET, "https://codewithchris.com/code/afsample.json").responseJSON { (response) -> Void in
            
            if let JSON = response.result.value {
                print(JSON)
            }
        }
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

