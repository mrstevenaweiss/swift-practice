//
//  ItemStore.swift
//  lootlogger
//
//  Created by steven weiss on 6/17/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    let itemArchiveURL:URL = {
        let documentsDirectories =
            FileManager.default.urls(for:.documentDirectory,in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.plist")
    }()
    
//    init() {
//        for _ in 0..<5 {
//            createItem()
//        }
//    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        // get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        // remove item from array
        allItems.remove(at: fromIndex)
        
        // insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    
    func saveChanges() -> Bool {
        do {
            let encoder = PropertyListEncoder()
//        let data = encoder.encode(allItems)
            let data = try encoder.encode(allItems)
        } catch let encodingError {
            print("Error encoding allItems:\(encodingError)")
        }
        return false
    }
    
}
