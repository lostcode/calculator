//
//  ViewController.swift
//  Calculator
//
//  Created by Manoj Ganesan on 1/27/15.
//  Copyright (c) 2015 Manoj Ganesan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    
    var curVal: Double {
        get {
            return (result.text! as NSString).doubleValue
        }
        set {
            result.text = "\(newValue)"
            inProgress = false
        }
    }
    
    var inProgress: Bool = false
    var prevVal: Double?
    var prevOpn: String = ""
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if !inProgress {
            result.text = digit
            inProgress = true
        }
        else {
            result.text = result.text! + digit
        }
    }
    
    @IBAction func onDelete(sender: AnyObject) {
        if inProgress {
            result.text = dropLast(result.text!)
            if result.text! == "" {
                curVal = 0
            }
        }
    }
    
    @IBAction func onEqual(sender: UIButton) {
        if prevVal != nil {
            curVal = performOperation(prevVal!, op2: curVal, operation: prevOpn)
            prevVal = curVal
            prevOpn = ""
            inProgress = false
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if prevVal != nil && inProgress {
            curVal = performOperation(prevVal!, op2: curVal, operation: prevOpn)
            prevVal = curVal
            prevOpn = operation
            inProgress = false
        }
        else if prevVal != nil && !inProgress {
            prevOpn = operation
        }
        else if prevVal == nil && inProgress {
            // first operator after digits are entered
            prevVal = curVal
            prevOpn = operation
            inProgress = false
        }
    }
    
    func performOperation(op1: Double, op2: Double, operation: String) -> Double {
        switch operation {
            case "-" :
                return op1 - op2
            case "+":
                return op1 + op2
            case "÷":
                return op1 / op2
            case "×":
                return op1 * op2
            default:
                return 0
        }
    }
}

