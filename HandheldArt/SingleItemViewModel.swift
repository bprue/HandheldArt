//
//  SingleItemViewModel.swift
//  ExpandingStackCells
//
//  Created by József Vesza on 27/06/15.
//  Copyright © 2015 Jozsef Vesza. All rights reserved.
//

import UIKit

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