//
//  SimpleItemStore.swift
//  ExpandingStackCells
//
//  Created by József Vesza on 27/06/15.
//  Copyright © 2015 Jozsef Vesza. All rights reserved.
//

import UIKit

struct SimpleItemStore {
    static func defaultItems() -> [SimpleItem] {
        return [
            SimpleItem(title: "Grants", detail: "The University of South Carolina Provost Initiative \nThe Columbia Museum of Art \nThe National Art Education Association \nThe University of South Carolina Center for Digital Humanities"),
            SimpleItem(title: "Handheld Art Project Creator", detail: "Karen Heid, PhD"),
            SimpleItem(title: "Handheld Art Project Assistants", detail: "Robert Blank, MLIS \nMolly Carlson, BS \n Jessica Dame, MLIS \nSarah Funk, MLIS \nKatielyn Gadow, MAT \nSara McGregor, MAT"),
            SimpleItem(title: "Columbia Museum of Art Contributors", detail: "Kerry Kuhlkin-Hornsby, Director of Education \nJonathan Goley, Digital Media Manager"),
            SimpleItem(title: "Gibbes Museum of Art Contributors", detail: "Becca Hiester, Curatorial Assistant \nRebecca Sailor, Curator of Education")
                    ]
    }
}