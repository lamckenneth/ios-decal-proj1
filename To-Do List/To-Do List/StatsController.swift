//
//  StatsController.swift
//  To-Do List
//
//  Created by Kenneth Lam on 2/23/16.
//  Copyright © 2016 Kenneth Lam. All rights reserved.
//

import UIKit

class StatsController: UIViewController {
    
    @IBOutlet var topLabel : UILabel!
    @IBOutlet var numberLabel : UILabel!
    @IBOutlet var bottomLabel : UILabel!
    var numberOfCompletedStuff : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        topLabel.text = "YOU COMPLETED"
        numberLabel.text = String(numberOfCompletedStuff)
        bottomLabel.text = "IN THE LAST 24 HOURS"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
