//
//  ViewController.swift
//  Bullseye
//
//  Created by Rumi on 2/3/20.
//  Copyright © 2020 Rumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // Default value of the slider. Trying to remember the data on the sliders.
    // No longer matters as it will be overwritten in viewDidLoad() method. However, swift demands all variables always have some value.
    var currentValue: Int = 0
    var score = 0
    
    // Creating an outlet.
    @IBOutlet weak var slider: UISlider!
    
    // Creating another Outlet but this time for the labels for the target number.
    // We linked targetLabel from the storyboard. Linking the number on the slider to the top most number (default number 100)
    @IBOutlet weak var targetLabel: UILabel!
    
    var targetValue = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var round = 0
    
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startnewRound()
    }
    
    // For the button.
    @IBAction func showAlert()
    {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points
        
        let message = "You scored \(points) points"
        //let message = "The value of the slider is: \(currentValue)" +  "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler:nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startnewRound()
    }
    
    // For the slider. Reading data on the slider.
    @IBAction func sliderMoved(_ slider: UISlider)
    {
        currentValue = lroundf(slider.value)
    }
    
    func startnewRound()
    {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        
        updateLabels()
    }
    
    // This updates the label for number 100 (default number)
    func updateLabels()
    {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
}

