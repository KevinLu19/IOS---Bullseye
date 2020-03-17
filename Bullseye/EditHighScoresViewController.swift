//
//  EditHighScoresViewController.swift
//  Bullseye
//
//  Created by Rumi on 3/16/20.
//  Copyright © 2020 Rumi. All rights reserved.
//

import UIKit

class EditHighScoresViewController: UITableViewController
{
    @IBAction func cancel()
    {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done()
    {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }
}
