//
//  ViewController.swift
//  Project3.1
//
//  Created by steven weiss on 4/22/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    var countryNames = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//            navigationController?.navigationBar.prefersLargeTitles = true

//        title = "Storm Viewer"
//        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasSuffix("2x.png") {
                pictures.append(item)
                let parsed = item.replacingOccurrences(of: "@2x.png", with: "")
                countryNames.append(parsed.uppercased())
            }
        }
        print(countryNames)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text =
            countryNames[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            vc.countryName = countryNames[indexPath.row]

            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
