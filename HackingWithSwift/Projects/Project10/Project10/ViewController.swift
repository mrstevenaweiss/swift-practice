//
//  ViewController.swift
//  Project10
//
//  Created by steven weiss on 5/23/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCell else {
            // we failed to get a PersonCell – bail out!
            fatalError("Unable to dequeue PersonCell.")
        }

        // if we're still here it means we got a PersonCell, so we can return it
        return cell
    }


}

