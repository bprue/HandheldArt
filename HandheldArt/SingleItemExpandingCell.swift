//
//  SingleItemExpandingCell.swift
//  ExpandingStackCells
//
//  Created by József Vesza on 27/06/15.
//  Copyright © 2015 Jozsef Vesza. All rights reserved.
//

import UIKit

class SingleItemExpandingCell: UITableViewCell {
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var detail: String? {
        didSet {
            detailLabel.text = detail
        }
    }
    
    @IBOutlet fileprivate weak var stackView: UIStackView!
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.arrangedSubviews.last?.isHidden = true
    }
    
    func changeCellStatus(_ selected: Bool){
        UIView.animate(withDuration: 0.5,
                                   delay: 0,
                                   usingSpringWithDamping: 1,
                                   initialSpringVelocity: 1,
                                   options: UIViewAnimationOptions.curveEaseIn,
                                   animations: { () -> Void in
                                    self.stackView.arrangedSubviews.last?.isHidden = !selected
            },
                                   completion: nil)
        
        
    }
}




struct SingleItemViewModel {
    
    fileprivate let items = SingleItemSimpleStore.singleItemItems()
    
    func count() -> Int {
        return items.count
    }
    
    func titleForRow(_ row: Int) -> String {
        return items[row].title
    }
    
    func detailForRow(_ row: Int) -> String {
        return items[row].detail
    }
}

struct SingleItemSimpleStore {
    static func singleItemItems() -> [SimpleItem] {
        return [
            SimpleItem(title: "Title", detail: "Thomas Willoughby, 4th Baron Middleton (1728-1781)"),
            SimpleItem(title: "Creator", detail: "George Romney (1734-1802)"),
            SimpleItem(title: "Subject", detail: "Portraits, Neoclassicism"),
            SimpleItem(title: "Source", detail: "Columbia Museum of Art")
        ]
    }
}

struct SingleItemSimpleItem {
    let title: String
    let detail: String
}
