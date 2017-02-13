//
//  UnitPlanViewController.swift
//  HandheldArt
//
//  Created by Elizabeth Pruett on 2/10/17.
//  Copyright © 2017 CDH. All rights reserved.
//

import UIKit

class UnitPlanViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var myURLString: String!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let myurl = URL(string: myURLString)
        let request = URLRequest(url: myurl!)
        webView.loadRequest(request)

        // Do any additional setup after lading the view.
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
