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
            SimpleItem(title: "Gibbes Museum of Art Contributors", detail: "Becca Hiester, Curatorial Assistant \nRebecca Sailor, Curator of Education"),
            SimpleItem(title: "Center for Digital Humanities Contributors", detail: "Colin F. Wilder, PhD, Associate Director \nJohn Knox, PhD, Assistant Director \nMolly Carlson, iOS Developer \nKang Du, Android Developer \nCollin Haines, Web Developer \nWayne Lemasters, iOS Developer \nJoshua Williams, Android Developer \nAkanksha, Android Developer \nElizabeth Pruett, iOS Developer"),
            SimpleItem(title: "Art Educators & Content Writers", detail: "Lynn Sanders-Bustle, PhD \nMolly Chance, IMA \nMolly Crowle, MAT \nGinger Henson, MAT \nKara Luke, IMA \nLane Laney, BFA \nStephanie Kaminer, BFA \nMichelle McDonald, MAT \nSara McGregor, MAT \nKatie Pfrommer, MAT \nJohn Sawvell, BFA \nMolly Whittaker, MAT \nCourtnie Wolfgang, PhD")
                    ]
    }
}
