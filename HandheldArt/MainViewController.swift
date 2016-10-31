//
//  MainViewController.swift
//  ExpandingStackCells
//
//  Created by József Vesza on 27/06/15.
//  Copyright © 2015 Jozsef Vesza. All rights reserved.
//

import UIKit

let expandingCellId = "expandingCell"
let estimatedHeight: CGFloat = 150
let topInset: CGFloat = 20

class MainViewController: UITableViewController {

    let viewModel = MainViewModel()
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        tableView.contentInset.top = topInset
        tableView.estimatedRowHeight = estimatedHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandingCell", for: indexPath) as! ExpandingCell
        
        cell.title = viewModel.titleForRow((indexPath as NSIndexPath).row)
        cell.detail = viewModel.detailForRow((indexPath as NSIndexPath).row)
        
        return cell
    }
    
    // MARK: Table view delegate
    
    
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        if let selectedIndex = tableView.indexPathForSelectedRow , selectedIndex == indexPath {
            
            if let cell = tableView.cellForRow(at: indexPath) as? ExpandingCell {
                tableView.beginUpdates()
                tableView.deselectRow(at: indexPath, animated: true)
                cell.changeCellStatus(false)
                tableView.endUpdates()
            }
            
            return nil
        }
        
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ExpandingCell
        cell.changeCellStatus(true)
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? ExpandingCell {
            cell.changeCellStatus(false)
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
    
    


    

}
