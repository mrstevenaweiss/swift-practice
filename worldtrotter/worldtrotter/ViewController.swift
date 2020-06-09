//
//  ViewController.swift
//  worldtrotter
//
//  Created by steven weiss on 6/2/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        
        let firstFrame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = UIColor.blue
        
        func cgColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> CGColor {
          return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0).cgColor
        }

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = firstView.bounds
        gradientLayer.colors = [cgColor(red: 209.0, green: 0.0, blue: 0.0),
                                cgColor(red: 255.0, green: 102.0, blue: 34.0),
                                cgColor(red: 255.0, green: 218.0, blue: 33.0),
                                cgColor(red: 51.0, green: 221.0, blue: 0.0),
                                cgColor(red: 17.0, green: 51.0, blue: 204.0),
                                cgColor(red: 34.0, green: 0.0, blue: 102.0),
                                cgColor(red: 51.0, green: 0.0, blue: 68.0)]

        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        firstView.layer.addSublayer(gradientLayer)
        
        view.addSubview(firstView)
        self.view.sendSubviewToBack(firstView)
        
    }

}

//        
//        let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
//        let secondView = UIView(frame: secondFrame)
//        secondView.backgroundColor = UIColor.green
////        view.addSubview(secondView)
//        firstView.addSubview(secondView)

