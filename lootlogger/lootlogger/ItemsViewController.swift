//
//  ItemsViewController.swift
//  lootlogger
//
//  Created by steven weiss on 6/15/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.

import UIKit

class ItemsViewController: UITableViewController {

    var itemStore: ItemStore!
    var imageStore: ImageStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.rowHeight = 65
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
//        // make a new index path for the 0th section, last row
//        let lastRow = tableView.numberOfRows(inSection: 0)
//        let indexPath = IndexPath(row: lastRow, section: 0)
//
//        // insert this new row into the table
//        tableView.insertRows(at: [indexPath], with: .automatic)
        let newItem = itemStore.createItem()
        
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            // insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
//    @IBAction func toggleEditingMode(_ sender: UIButton) {
//        if isEditing {
//            // change text of button to inform user of state
//            sender.setTitle("Edit", for: .normal)
//            
//            // Turn off editing mode
//            setEditing(false, animated: true)
//        } else {
//            // change text of button to inform user of state
//            sender.setTitle("Done", for: .normal)
//            
//            // enter editing mode
//            setEditing(true, animated: true)
//        }
//    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        let item = itemStore.allItems[indexPath.row]
        
//        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = "$\(item.valueInDollars)"

        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "\(item.valueInDollars)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // if the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            // removew the item from the store
            itemStore.removeItem(item)
            
            imageStore.deleteImage(forKey: item.itemKey)
            
            // also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        //update the model
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if the triggered segue is the "showItem" segue
        switch segue.identifier {
            case "showItem":
            // figure out which row was just tapped
                if let row = tableView.indexPathForSelectedRow?.row {
                    let item = itemStore.allItems[row]
                    let detailViewController = segue.destination as! DetailViewController
                    detailViewController.item = item
                    detailViewController.imageStore = imageStore
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
}
