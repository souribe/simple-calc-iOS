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
    var rvalue = ""
    var result = ""
    var operation : Operation = .Null
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func numbersPressed(_ sender: UIButton) {
        numbers += "\(sender.tag)"
        label.text = numbers
    }
    
    @IBAction func dot(_ sender: UIButton) {
        numbers += "."
        label.text = numbers
    }
    
    @IBAction func allClear(_ sender: UIButton) {
    }
    
    @IBAction func equals(_ sender: UIButton) {
    }
    
    @IBAction func add(_ sender: UIButton) {
    }
    
    @IBAction func subtract(_ sender: UIButton) {
    }
    
    @IBAction func multiply(_ sender: UIButton) {
    }
    
    @IBAction func divide(_ sender: UIButton) {
    }
    
    @IBAction func mod(_ sender: UIButton) {
    }
    
    @IBAction func count(_ sender: UIButton) {
    }
    
    @IBAction func avg(_ sender: UIButton) {
    }
    
    @IBAction func fact(_ sender: UIButton) {
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

