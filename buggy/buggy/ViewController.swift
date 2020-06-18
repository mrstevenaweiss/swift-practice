//
//  ViewController.swift
//  buggy
//
//  Created by steven weiss on 6/15/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
//        print("Called buttonTapped():)")
        print("Method: \(#function) in file; \(#file) line: \(#line) called.")
//        // log sender:
//        print("sender: \(sender)")
//        // log the control state
//        print("Is control on? \(sender.isOn)")
        badMethod()
}

    func badMethod() {
        let array = NSMutableArray()
        
        for i in 0..<10 {
            array.insert(i, at: i)
        }
        for _ in 0..<10 {
            array.removeObject(at: 0)
        }
    }

}

