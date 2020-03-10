//
//  ViewController.swift
//  Tester
//
//  Created by steven weiss on 3/8/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UIButton!
    
    @IBAction func changeTitle(_ sender: Any) {
        mainLabel.setTitle("This app rocks", for: UIControl.State.normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

