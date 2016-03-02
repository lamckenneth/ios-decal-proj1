//
//  AddController.swift
//  To-Do List
//
//  Created by Kenneth Lam on 2/23/16.
//  Copyright © 2016 Kenneth Lam. All rights reserved.
//

import UIKit

class AddController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var listController : ListController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        let whitespaceSet = NSCharacterSet.whitespaceCharacterSet()
        if textField.text!.stringByTrimmingCharactersInSet(whitespaceSet) != "" {
            
            if (listController.dictionaryOfElementsAndChecks.indexForKey(textField.text!) != nil) {
                return false
            }
            
            textField.resignFirstResponder()
            listController.dictionaryOfElementsAndChecks[textField.text!] = false
            listController.dictionaryOfElementsAndDates[textField.text!] = NSDate()
            listController.tableView.reloadData()
            self.performSegueWithIdentifier("unwindToList", sender: self)
            return true
        }
        
        return false
    }
    
}
