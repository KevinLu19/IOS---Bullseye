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
    var currentValue: Int = 50
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // For the button.
    @IBAction func showAlert()
    {
        let message = "The value of the slider is: \(currentValue)"
        
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler:nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // For the slider. Reading data on the slider.
    @IBAction func sliderMoved(_ slider: UISlider)
    {
        currentValue = lroundf(slider.value)
    }
}

