//
//  MoodSelectionViewController.swift
//  mandala
//
//  Created by steven weiss on 6/30/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import UIKit

class MoodSelectionViewController: UIViewController {
//    @IBOutlet var stackView: UIStackView!
    @IBOutlet var addMoodButton: UIButton!
    @IBOutlet var moodSelector: ImageSelector!
    
    var moods: [Mood] = [] {
        didSet {
            currentMood = moods.first
            moodSelector.images = moods.map { $0.image }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moods = [.happy, .sad, .angry, .goofy, .crying, .confused, .sleepy, .meh]
        addMoodButton.layer.cornerRadius = addMoodButton.bounds.height / 2
        
    }
    
    var currentMood: Mood? {
        didSet {
            guard let currentMood = currentMood else {
                addMoodButton?.setTitle(nil, for: .normal)
                addMoodButton?.backgroundColor = nil
                return
            }
            
            addMoodButton?.setTitle("I'm \(currentMood.name)", for: .normal)
            addMoodButton?.backgroundColor = currentMood.color
        }
    }
    
//    @objc func moodSelectionChange(_ sender: UIButton) {
//        guard let selectedIndex = moodButtons.firstIndex(of: sender) else {
//            preconditionFailure(
//                "Unable to find the tapped button in the buttons array.")
//        }
    @IBAction private func moodSelectionChange(_ sender: ImageSelector) {
        let selectedIndex = sender.selectedIndex
        currentMood = moods[selectedIndex]
    }
    
    var moodsConfigurable: MoodsConfigurable!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "embedContainerViewController":
            guard let moodsConfigurable = segue.destination as? MoodsConfigurable else {
                preconditionFailure(
                    "View controller expected to confirm to MoodsConfigurable")
            }
            self.moodsConfigurable = moodsConfigurable
            segue.destination.additionalSafeAreaInsets =
                UIEdgeInsets(top: 0, left: 0, bottom: 160, right: 0)
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }

    @IBAction func addMoodTapped(_ sender: Any) {
        guard let currentMood = currentMood else {
            return
        }
        
        let newMoodEntry = MoodEntry(mood: currentMood, timestamp: Date())
        moodsConfigurable.add(newMoodEntry)
    }

}

