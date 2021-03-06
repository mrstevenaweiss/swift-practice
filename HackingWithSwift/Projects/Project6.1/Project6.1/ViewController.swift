//
//  ViewController.swift
//  Project6.1
//
//  Created by steven weiss on 5/4/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToList))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(clearList))
        
    }
    // Show many rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodItem", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }

    // This pop up a submit modal, dialogue
    @objc func addToList() {
           let ac = UIAlertController(title: "Add to grocery list", message: nil, preferredStyle: .alert)
            ac.addTextField()

            let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
                guard let answer = ac?.textFields?[0].text else { return }
                self?.submit(answer)
            }

            ac.addAction(submitAction)
            present(ac, animated: true)
        }
    
    @objc func clearList() {
        shoppingList.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    // This adds our grocery item to the list
    func submit(_ answer: String) {
        // Add to our shoppingLiost
        shoppingList.insert(answer, at: 0)

        // This presents our new item in the list...
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    

}

