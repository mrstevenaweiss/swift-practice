//
//  DetailViewController.swift
//  lootlogger
//
//  Created by steven weiss on 6/20/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    
    
//    @IBAction func choosePhotoSource(_ sender: UIBarButtonItem) {
//        print("yo")
//        
//        let alertContoller = UIAlertController(title: nil,
//                                               message: nil,
//                                               preferredStyle: .actionSheet)
//        
//        let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
//            print("Present Camera")
//        }
//        alertContoller.addAction(cameraAction)
//        
//        let photoLibaryAction = UIAlertAction(title: "Photo Library", style: .default){ _ in
//            print("Present photo library")
//        }
//        alertContoller.addAction(photoLibaryAction)
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        alertContoller.addAction(cancelAction)
//        
//        present(alertContoller, animated: true, completion: nil)
//    }
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name 
        }
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialField.text = item.serialNumber
//        valueField.text = "\(item.valueInDollars)"
//        dateLabel.text = "\(item.dateCreated)"
        valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        item.name = nameField.text ?? ""
        item.serialNumber = serialField.text
        
        if let valueText = valueField.text,
            let value = numberFormatter.number(from: valueText) {
            item.valueInDollars = value.intValue
        } else {
            item.valueInDollars = 0 
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
