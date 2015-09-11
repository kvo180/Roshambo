//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Khoa Vo on 9/9/15.
//  Copyright (c) 2015 AppSynth. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - Choices
    var userPlay: String!
    var cpuPlay: String!
    
    // MARK: - Outlets
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var resultsImage: UIImageView!
    
    // MARK: - Random generator
    func randomPlay() -> Int {
        let random = arc4random_uniform(3) // returns a random number between 0 and 2
        return Int(random)
    }
    
    // MARK: - View Lifecycle Methods
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // generate a random play value before view appears
        let choices = ["Rock", "Paper", "Scissors"]
        cpuPlay = choices[randomPlay()]
        
        println("userPlay is \(userPlay)")
        println("cpuPlay is \(cpuPlay)")
        
        evaluateResults()
    }
    
    // MARK: - UI
    func evaluateResults() {
        var text: String
        var resultsAction: String
        var imageName: String
        var youWon: Bool = false // initialize to false
        let tieString = "\(userPlay) vs. \(cpuPlay)"
        
        // Handle tied game events
        if userPlay == cpuPlay {
            resultsLabel.text = "\(tieString): It's a tie!"
            resultsImage.image = UIImage(named: "itsATie")
            return
        }
        
        // Evaluate if player is winner 
        switch userPlay {
        case "Rock":
            youWon = cpuPlay == "Scissors"
            resultsAction = "crushes"
        case "Paper":
            youWon = cpuPlay == "Rock"
            resultsAction = "covers"
        default:
            youWon = cpuPlay == "Paper"
            resultsAction = "cut"
        }
        
        // Set text and imageName when user wins
        if youWon == true {
            text = "Your \(userPlay) \(resultsAction) my \(cpuPlay): YOU WIN!"
            imageName = "\(userPlay)-\(cpuPlay)"
        }
        
        // Set text and imageName when user doesn't win
        else {
            switch cpuPlay {
            case "Rock":
                resultsAction = "crushes"
            case "Paper":
                resultsAction = "covers"
            default:
                resultsAction = "cut"
            }
            
            text = "My \(cpuPlay) \(resultsAction) your \(userPlay): YOU LOSE!"
            imageName = "\(cpuPlay)-\(userPlay)"
        }
        
        // Sets UI objects
        resultsLabel.text = text
        resultsImage.image = UIImage(named: imageName)
    }
    
    // Dismiss this view controller
    @IBAction func playAgain(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

}
