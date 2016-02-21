//
//  ViewController.swift
//  Color Fantasic
//
//  Created by Bruce Burgess on 2/21/16.
//  Copyright © 2016 Bruce Burgess. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //Connects the tableview from the storyboard to code.
    @IBOutlet weak var tableView: UITableView!
    
    //This variable will take the selected color from the user and store it
    var selectedColor : UIColor?
    
    //Setting colors
    let colors : [UIColor] = [UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor(), UIColor.purpleColor(), UIColor(colorLiteralRed: 255/255, green: 0/255, blue: 128/255, alpha: 1.0), UIColor.blackColor()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Connecting the delegate and data source to this View Controller
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //This creates the number of rows in the the table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    //This creates cells for the table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = self.colors[indexPath.row]
        return cell
    }
    
    //This function is called when the user selects a row. It goes to the color view controller
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //Storing the select color to pass to the next view
        self.selectedColor = self.colors[indexPath.row]
        //Unselects the selected cell
        //tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //Performes the transition using the segue to next view controller
        self.performSegueWithIdentifier("colorSegue", sender: self)
    }
    
    //This function executes just before transition to other view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "colorSegue" {
            //Make the background color of the view from what the user selected
            segue.destinationViewController.view.backgroundColor = self.selectedColor
        }
    }


}

