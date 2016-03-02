//
//  ListController.swift
//  To-Do List
//
//  Created by Kenneth Lam on 2/23/16.
//  Copyright © 2016 Kenneth Lam. All rights reserved.
//

import UIKit

class ListController: UITableViewController {
    
    var dictionaryOfElementsAndChecks = [String : Bool]()
    var dictionaryOfElementsAndDates = [String : NSDate]()
    var numberOfCompletedStuff : Int = 0
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        var arrayOfKeys = Array(dictionaryOfElementsAndDates.keys)
        
        for key in arrayOfKeys {
            let timeDifference = NSDate().timeIntervalSinceDate(dictionaryOfElementsAndDates[key]!);
            if (timeDifference > 5 && dictionaryOfElementsAndChecks[key]!) {
                dictionaryOfElementsAndChecks.removeValueForKey(key)
                dictionaryOfElementsAndDates.removeValueForKey(key)
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionaryOfElementsAndChecks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var keys = Array(dictionaryOfElementsAndChecks.keys).sort()

        let cell = tableView.dequeueReusableCellWithIdentifier("stuff", forIndexPath: indexPath)
        cell.textLabel!.text = keys[indexPath.row]
        cell.textLabel!.font = UIFont(name:"AvenirNextCondensed-Medium", size: 18)
        
        if (dictionaryOfElementsAndChecks[keys[indexPath.row]] == false) {
            
            cell.accessoryType = .None
            
        } else if (dictionaryOfElementsAndChecks[keys[indexPath.row]] == true) {
            
            cell.tintColor = UIColor(red: 0, green: 190/255, blue: 0, alpha: 1)
            cell.accessoryType = .Checkmark
            
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            
            var keys = Array(dictionaryOfElementsAndChecks.keys).sort()
            
            if (cell.accessoryType == .Checkmark) {
                
                cell.accessoryType = .None
                dictionaryOfElementsAndChecks[keys[indexPath.row]] = false
                
            } else {
                
                cell.tintColor = UIColor(red: 0, green: 190/255, blue: 0, alpha: 1)
                cell.accessoryType = .Checkmark
                dictionaryOfElementsAndChecks[keys[indexPath.row]] = true
                dictionaryOfElementsAndDates[keys[indexPath.row]] = NSDate()
                
            }
            
        }    
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        dictionaryOfElementsAndChecks.removeValueForKey(Array(dictionaryOfElementsAndChecks.keys).sort()[indexPath.row])
        dictionaryOfElementsAndDates.removeValueForKey(Array(dictionaryOfElementsAndDates.keys).sort()[indexPath.row])
        self.tableView.reloadData()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "statsSegue") {
            
            var values = Array(dictionaryOfElementsAndChecks.values)
            
            numberOfCompletedStuff = 0
            for boolean in values {
                if (boolean == true) {
                    numberOfCompletedStuff += 1
                }
            }
            
            let statsView = segue.destinationViewController as! StatsController
            statsView.numberOfCompletedStuff = numberOfCompletedStuff
            
        } else if (segue.identifier == "addSegue") {
            
            let addView = segue.destinationViewController as! AddController
            addView.listController = self
            
        }
        
    }
    
}
