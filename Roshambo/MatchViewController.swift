//
//  MatchViewController.swift
//  Roshambo
//
//  Created by Khoa Vo on 9/9/15.
//  Copyright (c) 2015 AppSynth. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {
    
    // MARK: - Initialize the 3 button outlets:
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!

    // MARK: - Programmatic approach for rock
    @IBAction func rockPressed(sender: UIButton) {
        print("rock pressed")
        
        // Instantiate ResultsViewController
        let controller = storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController // get assembled ResultsViewController from storyboard (which returns an AnyObject!) and cast as ResultsViewController
        
        // Communicate match
        controller.userPlay = getUserPlay(sender)
        
        if let navigationController = self.navigationController {
            navigationController.pushViewController(controller, animated: true)
        }
    }
    
    // MARK: - Code with segue approach
    @IBAction func paperPressed(sender: UIButton) {
        print("paper pressed")
        
        performSegueWithIdentifier("play", sender: sender)
    }
    
    // MARK: - Segue only approach
    @IBAction func scissorsPressed(sender: UIButton) {
        print("scissors pressed")
    }
    
    // MARK: - prepareForSegue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "play" {
            let controller = segue.destinationViewController as! ResultsViewController
            
            controller.userPlay = getUserPlay(sender as! UIButton)
        }
    }
    
    // MARK: - Utilities 
    func getUserPlay(sender: UIButton) -> String {
        if sender == rockButton {
            return "Rock"
        } else if sender == paperButton {
            return "Paper"
        } else {
            return "Scissors"
        }
    }
}

