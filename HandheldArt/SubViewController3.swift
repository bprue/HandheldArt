//
//  SubViewController3.swift
//  HandheldArt
//
//  Created by CDH on 3/28/16.
//  Copyright © 2016 CDH. All rights reserved.
//


// Icons from https://icons8.com/license/

import UIKit

class SubViewController3: UIViewController {
    @IBOutlet weak var EnduringIdeaTitle: UILabel!
    @IBOutlet weak var EnduringIdeaDesc: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var KeyConcepts: UILabel!
    @IBOutlet weak var EssentialQs: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        // Do any additional setup after loading the view.
        
        self.EnduringIdeaTitle.text = "Aging"
        self.EnduringIdeaDesc.text = "Aging refers to intangible and tangible changes in an organism, object, and natural forms. In living organisms aging is recognized by a gradual change that leads to increased risk of weakness, disease, and death. Aging takes place over the entire adult life span of any living thing. While aging does refer to the process through which humans reach a particular stage in life, aging also refers to gaining and developing intangibles such as wisdom, knowledge, and experiences. \nArt objects such as portraits, photographs, prints, and sculptures often depict signs of physical aging in realistic and exaggerated detail. Many artworks depict coming of age milestones and ceremonies associated with cultural expectations related to age. \nMan-made objects and natural forms also age producing effortless patinas that add vibrant colors and distinctive textures to surfaces. Forces in nature age wood, stone, and landforms to produce monuments, crystals, and sculptural forms which serve as creative and artistic representation for many works of art. Ceramic and sculptural objects often replicate visual details associated by aging on their surfaces and objects displayed in museums across the world represent evidences and degrees of aging providing clues to their histories and broadening appreciation of visual qualities associated with aging."
        
        self.KeyConcepts.text = "• Perceptions/Misperceptions of aging are varied \n• Changes associated with aging are tangible and intangible \n• Milestones/Rituals associated with aging"
        
        self.EssentialQs.text = "• How is aging portrayed in culture? \n• In what ways are changes evident? \n•What rituals are often associated aging?"
        
    
    }
    
    

    
    

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
