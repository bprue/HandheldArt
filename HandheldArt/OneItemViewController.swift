//
//  OneItemViewController.swift
//  HandheldArt
//
//  Created by CDH on 3/28/16.
//  Copyright © 2016 CDH. All rights reserved.
//

import UIKit

class OneItemViewController: UIViewController {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var textTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageURL:NSURL? = NSURL(string: "http://handheldart.org/files/original/7b3438882572a8be9a03b87e1c7b23de.jpg")
        
        if let url = imageURL {
            itemImage.sd_setImageWithURL(url)
        }
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //self.textTest.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor metus maximus quam laoreet ullamcorper. In sed nisl eget diam bibendum aliquam. Mauris placerat sollicitudin lacus, vel finibus eros egestas at. In faucibus sapien nisi, non consectetur nulla facilisis sit amet. Pellentesque sit amet molestie ligula, eu malesuada quam. Vestibulum pellentesque urna non tempus ultrices. Duis lorem erat, dapibus et nulla eu, semper dapibus neque. Morbi fringilla diam eget consectetur aliquam. Cras iaculis sodales orci eget pretium. Vivamus mollis libero in ipsum ultrices scelerisque. Sed laoreet ex eu ipsum malesuada lobortis. Integer aliquet pulvinar augue eget tristique. Maecenas tellus velit, posuere quis sapien sed, semper lobortis mi. Etiam tempus vulputate dapibus. Sed fringilla placerat dolor quis pellentesque. Ut egestas erat id tellus feugiat maximus. Fusce vitae sem euismod, accumsan libero vel, feugiat quam. Aliquam erat volutpat. Etiam dui dolor, semper vel enim sed, dapibus congue turpis. Duis semper auctor purus, a sodales leo pulvinar eu. Vestibulum at vestibulum enim.Aliquam et malesuada elit. Mauris commodo suscipit mattis. Fusce lobortis lacinia leo in dictum. Aliquam blandit vestibulum augue, ac tempus orci sagittis vel. In hac habitasse platea dictumst. Vivamus et efficitur dolor. Cras non imperdiet libero. Quisque eget rhoncus leo, non ornare velit. Fusce ultricies orci viverra lorem venenatis, ut tincidunt arcu consectetur. Donec pellentesque sodales bibendum. Pellentesque ultricies vehicula consectetur. Sed euismod orci vitae risus cursus, eu laoreet ante posuere. Nullam dictum ac libero id rhoncus. Integer gravida ac elit ornare auctor. Nam pulvinar nisl non neque porttitor, eget sagittis lorem aliquam. Quisque pulvinar odio sed massa rutrum scelerisque. Donec id hendrerit odio. Mauris tincidunt elit sit amet felis maximus, id cursus sem auctor. Morbi sit amet euismod nisl. Proin vitae volutpat odio, in vulputate orci. Nullam malesuada faucibus nulla, eget dignissim elit varius quis. Quisque eget elit ac neque euismod accumsan eu quis turpis. Praesent et justo vitae est cursus sagittis. Morbi vel risus vitae magna rhoncus rhoncus. Curabitur eu sem dolor. Pellentesque tristique gravida mauris, at placerat sapien feugiat ac. Suspendisse in malesuada purus, a porttitor nulla. Nullam id est non nibh venenatis varius vel eu libero. Quisque aliquam magna lorem, a sollicitudin libero malesuada ac. Aenean accumsan lacus vel turpis condimentum, in lobortis nibh hendrerit. Nullam non erat enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor metus maximus quam laoreet ullamcorper. In sed nisl eget diam bibendum aliquam. Mauris placerat sollicitudin lacus, vel finibus eros egestas at. In faucibus sapien nisi, non consectetur nulla facilisis sit amet. Pellentesque sit amet molestie ligula, eu malesuada quam. Vestibulum pellentesque urna non tempus ultrices. Duis lorem erat, dapibus et nulla eu, semper dapibus neque. Morbi fringilla diam eget consectetur aliquam. Cras iaculis sodales orci eget pretium. Vivamus mollis libero in ipsum ultrices scelerisque. Sed laoreet ex eu ipsum malesuada lobortis. Integer aliquet pulvinar augue eget tristique. Maecenas tellus velit, posuere quis sapien sed, semper lobortis mi. Etiam tempus vulputate dapibus. Sed fringilla placerat dolor quis pellentesque. Ut egestas erat id tellus feugiat maximus. Fusce vitae sem euismod, accumsan libero vel, feugiat quam. Aliquam erat volutpat. Etiam dui dolor, semper vel enim sed, dapibus congue turpis. Duis semper auctor purus, a sodales leo pulvinar eu. Vestibulum at vestibulum enim.Aliquam et malesuada elit. Mauris commodo suscipit mattis. Fusce lobortis lacinia leo in dictum. Aliquam blandit vestibulum augue, ac tempus orci sagittis vel. In hac habitasse platea dictumst. Vivamus et efficitur dolor. Cras non imperdiet libero. Quisque eget rhoncus leo, non ornare velit. Fusce ultricies orci viverra lorem venenatis, ut tincidunt arcu consectetur. Donec pellentesque sodales bibendum. Pellentesque ultricies vehicula consectetur. Sed euismod orci vitae risus cursus, eu laoreet ante posuere. Nullam dictum ac libero id rhoncus. Integer gravida ac elit ornare auctor. Nam pulvinar nisl non neque porttitor, eget sagittis lorem aliquam. Quisque pulvinar odio sed massa rutrum scelerisque. Donec id hendrerit odio. Mauris tincidunt elit sit amet felis maximus, id cursus sem auctor. Morbi sit amet euismod nisl. Proin vitae volutpat odio, in vulputate orci. Nullam malesuada faucibus nulla, eget dignissim elit varius quis. Quisque eget elit ac neque euismod accumsan eu quis turpis. Praesent et justo vitae est cursus sagittis. Morbi vel risus vitae magna rhoncus rhoncus. Curabitur eu sem dolor. Pellentesque tristique gravida mauris, at placerat sapien feugiat ac. Suspendisse in malesuada purus, a porttitor nulla. Nullam id est non nibh venenatis varius vel eu libero. Quisque aliquam magna lorem, a sollicitudin libero malesuada ac. Aenean accumsan lacus vel turpis condimentum, in lobortis nibh hendrerit. Nullam non erat enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor metus maximus quam laoreet ullamcorper. In sed nisl eget diam bibendum aliquam. Mauris placerat sollicitudin lacus, vel finibus eros egestas at. In faucibus sapien nisi, non consectetur nulla facilisis sit amet. Pellentesque sit amet molestie ligula, eu malesuada quam. Vestibulum pellentesque urna non tempus ultrices. Duis lorem erat, dapibus et nulla eu, semper dapibus neque. Morbi fringilla diam eget consectetur aliquam. Cras iaculis sodales orci eget pretium. Vivamus mollis libero in ipsum ultrices scelerisque. Sed laoreet ex eu ipsum malesuada lobortis. Integer aliquet pulvinar augue eget tristique. Maecenas tellus velit, posuere quis sapien sed, semper lobortis mi. Etiam tempus vulputate dapibus. Sed fringilla placerat dolor quis pellentesque. Ut egestas erat id tellus feugiat maximus. Fusce vitae sem euismod, accumsan libero vel, feugiat quam. Aliquam erat volutpat. Etiam dui dolor, semper vel enim sed, dapibus congue turpis. Duis semper auctor purus, a sodales leo pulvinar eu. Vestibulum at vestibulum enim.Aliquam et malesuada elit. Mauris commodo suscipit mattis. Fusce lobortis lacinia leo in dictum. Aliquam blandit vestibulum augue, ac tempus orci sagittis vel. In hac habitasse platea dictumst. Vivamus et efficitur dolor. Cras non imperdiet libero. Quisque eget rhoncus leo, non ornare velit. Fusce ultricies orci viverra lorem venenatis, ut tincidunt arcu consectetur. Donec pellentesque sodales bibendum. Pellentesque ultricies vehicula consectetur. Sed euismod orci vitae risus cursus, eu laoreet ante posuere. Nullam dictum ac libero id rhoncus. Integer gravida ac elit ornare auctor. Nam pulvinar nisl non neque porttitor, eget sagittis lorem aliquam. Quisque pulvinar odio sed massa rutrum scelerisque. Donec id hendrerit odio. Mauris tincidunt elit sit amet felis maximus, id cursus sem auctor. Morbi sit amet euismod nisl. Proin vitae volutpat odio, in vulputate orci. Nullam malesuada faucibus nulla, eget dignissim elit varius quis. Quisque eget elit ac neque euismod accumsan eu quis turpis. Praesent et justo vitae est cursus sagittis. Morbi vel risus vitae magna rhoncus rhoncus. Curabitur eu sem dolor. Pellentesque tristique gravida mauris, at placerat sapien feugiat ac. Suspendisse in malesuada purus, a porttitor nulla. Nullam id est non nibh venenatis varius vel eu libero. Quisque aliquam magna lorem, a sollicitudin libero malesuada ac. Aenean accumsan lacus vel turpis condimentum, in lobortis nibh hendrerit. Nullam non erat enim."
        // Do any additional setup after loading the view.
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
