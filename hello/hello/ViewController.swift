//
//  ViewController.swift
//  hello
//
//  Created by steven weiss on 3/17/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        button.addTarget(self, action: #selector(buttonTapped(_:)),
        for: .touchUpInside)

    }

    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        sender.isOn ? print("switch is on") : print("switch is off")
        
        print("The slider is set to \(slider.value)")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("Button was tapped!")
    }
    
    
}

