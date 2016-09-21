//
//  SingleItemViewController.swift
//  ExpandingStackCells
//
//  Created by József Vesza on 27/06/15.
//  Copyright © 2015 Jozsef Vesza. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

let siExpandingCellId = "expandingCell"
let siEstimatedHeight: CGFloat = 150
let siTopInset: CGFloat = 20



class SingleItemViewController: UITableViewController {
    
    let viewModel = SingleItemViewModel()
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
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
        
        
        tableView.contentInset.top = siTopInset
        tableView.estimatedRowHeight = siEstimatedHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("expandingCell", forIndexPath: indexPath) as! SingleItemExpandingCell
        
        cell.title = viewModel.titleForRow(indexPath.row)
        cell.detail = viewModel.detailForRow(indexPath.row)
        
        return cell
    }
    
    // MARK: Table view delegate
    
    
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        if let selectedIndex = tableView.indexPathForSelectedRow where selectedIndex == indexPath {
            
            if let cell = tableView.cellForRowAtIndexPath(indexPath) as? SingleItemExpandingCell {
                tableView.beginUpdates()
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                cell.changeCellStatus(false)
                tableView.endUpdates()
            }
            
            return nil
        }
        
        return indexPath
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! SingleItemExpandingCell
        cell.changeCellStatus(true)
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) as? SingleItemExpandingCell {
            cell.changeCellStatus(false)
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
    
    
    
    
    
    
}
