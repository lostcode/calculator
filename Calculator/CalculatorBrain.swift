//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Manoj Ganesan on 1/30/15.
//  Copyright (c) 2015 Manoj Ganesan. All rights reserved.
//

import Foundation

class CalculatorBrain {
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