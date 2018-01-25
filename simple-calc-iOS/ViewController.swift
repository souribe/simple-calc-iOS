//
//  ViewController.swift
//  simple-calc-iOS
//
//  Created by Benny on 1/25/18.
//  Copyright © 2018 Benny Souriyadeth. All rights reserved.
//

import UIKit

enum Operation : String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Mod = "%"
    case Count = "count"
    case Avg = "avg"
    case Fact = "fact"
    case Null = "Null"
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //label.text = "0" // changes text to 0
    }
    
    var numbers = ""
    var lValue = ""
    var rValue = ""
    var result = ""
    var curOperation : Operation = .Null
    
    var addCount = 1
    var avgCount = 0
    var addAvg : Double = 0
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func numbersPressed(_ sender: UIButton) {
        if numbers.count <= 8 {
            numbers += "\(sender.tag)"
            label.text = numbers
        }
    }
    
    @IBAction func dot(_ sender: UIButton) {
        if numbers.count <= 7 {
            numbers += "."
            label.text = numbers
        }
    }
    
    @IBAction func allClear(_ sender: UIButton) {
        numbers = ""
        lValue = ""
        rValue = ""
        result = ""
        curOperation = .Null
        label.text = "0"
        
        addCount = 1
        avgCount = 0
        addAvg = 0
    }
    
    @IBAction func equals(_ sender: UIButton) {
        if curOperation == .Avg {
            avgCount += 1 // tick forward
//            if lValue != "" {
//                addAvg += Double(lValue)!
//            } else {
//                addAvg += Double(rValue)!
//            }
            
            result = "\((addAvg) / Double(avgCount))"
            label.text = result
            avgCount = 0
            addAvg = 0
            lValue = result
        } else {
            operation(operation: curOperation)
        }
    }
    @IBAction func add(_ sender: UIButton) {
        operation(operation: .Add)
    }
    @IBAction func subtract(_ sender: UIButton) {
        operation(operation: .Subtract)
    }
    @IBAction func multiply(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    @IBAction func divide(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    @IBAction func mod(_ sender: UIButton) {
        operation(operation: .Mod)
    }
    
    ///////////
    // multiOperants
    @IBAction func count(_ sender: UIButton) {
        operation(operation: .Count)
        addCount += 1
    }
    @IBAction func avg(_ sender: UIButton) {
        operation(operation: .Avg)
        if lValue != "" {
            addAvg += Double(lValue)!
        } else {
            addAvg += Double(rValue)!
        }
        avgCount += 1
    }
    @IBAction func fact(_ sender: UIButton) {
        operation(operation: .Fact)
        if Int(lValue)! / 10 < 1 {
            if Int(lValue)! == 0 || Int(lValue)! == 1 {
                result = "1"
            } else {
                var num = Int(lValue)!
                var total = 1
                while num > 0 {
                    total *= num
                    num -= 1
                }
                result = "\(total)"
            }
        } else {
            result = "0"
            lValue = ""
            label.text = "0"
        }
        label.text = result
        lValue = result
        numbers = ""
        curOperation = .Null
    }

    func operation(operation: Operation) {
        if curOperation != .Null {
            if numbers != "" {
                rValue = numbers
                numbers = ""
                
                if curOperation == .Add {
                    result = "\(Double(lValue)! + Double(rValue)!)"
                } else if curOperation == .Subtract {
                    result = "\(Double(lValue)! - Double(rValue)!)"
                } else if curOperation == .Multiply {
                    result = "\(Double(lValue)! * Double(rValue)!)"
                } else if curOperation == .Divide {
                    result = "\(Double(lValue)! / Double(rValue)!)"
                } else if curOperation == .Mod {
                    result = "\(Double(lValue)!.truncatingRemainder(dividingBy: Double(rValue)!))"
                } else if curOperation == .Count {
                    result = "\(addCount)"
                }
                
//                //start calculations
//                switch curOperation {
//                case .Add:
//                    result = "\(Double(lValue)! + Double(rValue)!)"
//                case .Subtract:
//                    result = "\(Double(lValue)! - Double(rValue)!)"
//                case .Multiply:
//                    result = "\(Double(lValue)! * Double(rValue)!)"
//                case .Divide:
//                    result = "\(Double(lValue)! / Double(rValue)!)"
//                case .Mod:
//                    result = "\(Double(lValue)!.truncatingRemainder(dividingBy: Double(rValue)!))"
//                default: // .Count
//                    result =
//                }
                
                lValue = result //hold current result for next use
                if curOperation != .Avg {
                    if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) { // check for remainder of 0 (integer)
                        result = String(Int(Double(result)!))
                    }
                    label.text = result
                }
            }
            curOperation = operation
        } else {
            lValue = numbers
            numbers = ""
            // if for count, avg, and fact here
            curOperation = operation // next time number is pressed, we can calculate it
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

