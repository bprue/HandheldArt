//
//  SingleItemSimpleStore.swift
//  ExpandingStackCells
//
//  Created by József Vesza on 27/06/15.
//  Copyright © 2015 Jozsef Vesza. All rights reserved.
//

import UIKit

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