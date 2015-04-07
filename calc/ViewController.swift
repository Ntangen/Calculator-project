//
//  ViewController.swift
//  calc
//
//  Created by J. Blair Reeves, Jr. on 2/24/15.
//  Copyright (c) 2015 J. Blair Reeves, Jr. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    
    var userTyping = false
    let x = M_PI
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userTyping{
        display.text = display.text! + digit
        } else {
        display.text = digit
        userTyping = true
        }
        
    }
    
    @IBAction func backspace(sender: UIButton) {
        display.text = dropLast(display.text!)
    }
    
    @IBAction func pi(){
        display.text = "\(x)"
        userTyping = true
    }
   
    
    @IBAction func clear(sender: UIButton) {
        display.text = "0"
        history.text = "0"
        brain.clearStack()
    }
    
    @IBAction func operate(sender: UIButton) {
        if userTyping {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
         }
    }
    
    @IBAction func enter() {
        userTyping = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        }
        else {
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get {
            return (display.text! as NSString).doubleValue
        }
        set {
            display.text = "\(newValue)"
            userTyping = false
        }
    
    }

    @IBOutlet weak var history: UILabel!

    @IBAction func appendDigit2(sender: UIButton) {
        let digit = sender.currentTitle!
        history.text = history.text! + digit
    }

}
