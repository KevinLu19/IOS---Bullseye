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
        
        startNewGame()
        
        // Chapter 19 - Importing images for slider.
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .highlighted)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let track_left_image = UIImage(named: "SliderTrackLeft")!
        let track_left_resizeable = track_left_image.resizableImage(withCapInsets: insets)
        
        slider.setMinimumTrackImage(track_left_resizeable, for: .normal)
        
        let track_right_image = UIImage(named: "SliderTrackRight")!
        let track_right_resizable = track_right_image.resizableImage(withCapInsets: insets)
        
        slider.setMaximumTrackImage(track_right_resizable, for: .normal)
    }
    
    // For the button.
    @IBAction func showAlert()
    {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        score += points
        
        // Changing title based on player. If they were close, then we return a feedback indicating on how well they did.
        let title: String
        if difference == 0
        {
            title = "Perfect!"
            points += 100
        }
        else if difference < 5
        {
            title = "You're really close!"
            
            if difference == 1
            {
                points += 50
            }
        }
        else if difference < 10
        {
            title = "Not bad!"
        }
        else
        {
            title = "Not close at all"
        }
        
        score += points
        
        let message = "You scored \(points) points"
        //let message = "The value of the slider is: \(currentValue)" +  "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
//        let action = UIAlertAction(title: "Ok",
//                                   style: .default,
//                                   handler:nil)
        
        // Changing handler event to actually do something. In this case, start the new round again.
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: {_ in
                                    self.startnewRound()
                                    })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    // For the slider. Reading data on the slider.
    @IBAction func sliderMoved(_ slider: UISlider)
    {
        currentValue = lroundf(slider.value)
    }
    
    // Action handler to handle taps on start over button.
    @IBAction func startNewGame()
    {
        score = 0
        round = 0
        startnewRound()
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

