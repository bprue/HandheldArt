//
//  MainViewModel.swift
//  ExpandingStackCells
//
//  Created by József Vesza on 27/06/15.
//  Copyright © 2015 Jozsef Vesza. All rights reserved.
//

import UIKit

struct MainViewModel {
    
    fileprivate let items = SimpleItemStore.defaultItems()
    
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
