//
//  ViewController.swift
//  Calculator
//
//  Created by Emilia Casasola on 4/21/18.
//  Copyright © 2018 Ronald Badilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    var afterResult = false
    
    @IBOutlet weak var lblMain: UILabel!
    @IBOutlet weak var lblHistory: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            lblMain.text = String(Int(sender.tag))
            numberOnScreen = Double(lblMain.text!)!
            performingMath = false
        }
        else {
            lblMain.text = lblMain.text! + String(Int(sender.tag))
            numberOnScreen = Double(lblMain.text!)!
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        var result: Double = 0
        if lblMain.text != "" && sender.tag != 11 && sender.tag != 16{
            previousNumber = Double(lblMain.text!)!
            if sender.tag == 12 { //Divide
                lblMain.text = "/";
            }
            if sender.tag == 13 { //Multiply
                lblMain.text = "x";
            }
            if sender.tag == 14 { //Subtract
                lblMain.text = "-";
            }
            if sender.tag == 15 { //Add
                lblMain.text = "+";
            }
            operation = sender.tag
            performingMath = true
            
            if afterResult == false{
                lblHistory.text = (lblHistory.text)! + " " + String(Int(numberOnScreen)) + " " + (lblMain.text)!
            } else{
                lblHistory.text = (lblHistory.text)! + " " + " " + (lblMain.text)!
            }
            
        }
        else if sender.tag == 16 {
            if operation == 12{ //Divide
                result = (previousNumber / numberOnScreen)
            }
            else if operation == 13{ //Multiply
                result = (previousNumber * numberOnScreen)
            }
            else if operation == 14{ //Subtract
                result = (previousNumber - numberOnScreen)
            }
            else if operation == 15{ //Add
                result = (previousNumber + numberOnScreen)
            }
            
            if (result).truncatingRemainder(dividingBy: 1) == 0 {
                lblMain.text = String(Int(result))
            } else{
                lblMain.text = String(format: "%.2f",result)
            }
            
            lblHistory.text = (lblHistory.text)! + " " + String(Int(numberOnScreen)) + " = " + (lblMain.text)!
            performingMath = true
            afterResult = true
        }
        else if sender.tag == 11{
            lblMain.text = ""
            lblHistory.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
}

