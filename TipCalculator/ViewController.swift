//
//  ViewController.swift
//  TipCalculator
//
//  Created by Mallikarjun Patil on 12/7/15.
//  Copyright © 2015 Mallikarjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billFeild: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercentageSegControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text="$0.00"
        totalLabel.text="$0.00"
    }

    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = defaults.integerForKey("index")
        tipPercentageSegControl.selectedSegmentIndex=index
        
    }

    
    @IBAction func textFieldChanged(sender: AnyObject) {
        
        var tipPrecentages=[0.1,0.2,0.25]
        let selectedTipPercentage = tipPrecentages[tipPercentageSegControl.selectedSegmentIndex]
        let billAmount = NSString(string: billFeild.text!).doubleValue
        let tip = billAmount*selectedTipPercentage
        let total = billAmount+tip
        
//        tipLabel.text="$\(tip)"
//        totalLabel.text="$\(total)"
        
        
        tipLabel.text=String(format: "$%.2f", tip)
        totalLabel.text=String(format: "$%.2f", total)
        
    }
    @IBAction func onTapRecogniser(sender: AnyObject) {
        view.endEditing(true);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

