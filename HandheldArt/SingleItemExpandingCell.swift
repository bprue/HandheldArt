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
    
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.arrangedSubviews.last?.hidden = true
    }
    
    func changeCellStatus(selected: Bool){
        UIView.animateWithDuration(0.5,
                                   delay: 0,
                                   usingSpringWithDamping: 1,
                                   initialSpringVelocity: 1,
                                   options: UIViewAnimationOptions.CurveEaseIn,
                                   animations: { () -> Void in
                                    self.stackView.arrangedSubviews.last?.hidden = !selected
            },
                                   completion: nil)
        
        
    }
}




struct SingleItemViewModel {
    
    private let items = SingleItemSimpleStore.singleItemItems()
    
    func count() -> Int {
        return items.count
    }
    
    func titleForRow(row: Int) -> String {
        return items[row].title
    }
    
    func detailForRow(row: Int) -> String {
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
