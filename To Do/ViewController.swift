//
//  ViewController.swift
//  To Do
//
//  Created by Neel Patel on 02/09/16.
//  Copyright © 2016 Neel Patel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var neel = [String]()
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func button(sender: UIButton) {
        
        
        var newItems: String
        newItems = textField.text!
        neel.append(newItems)
        post()
        textField.text = ""
        textField.resignFirstResponder()
        tableView.reloadData()
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func post()
        {
            let tara: String
            tara = textField.text!
            
            let post : [String : AnyObject] = ["To-Do" : tara]
            
            let databaseRef = FIRDatabase.database().reference()
            
            databaseRef.child("To-Do List").childByAutoId().setValue(post)
        }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return neel.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = neel[indexPath.row]
        cell.textLabel?.textColor = .grayColor()
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
            neel.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }


}

