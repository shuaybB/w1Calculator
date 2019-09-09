//
//  ViewController.swift
//  w1Calculator
//
//  Created by shuayb on 2019-09-06.
//  Copyright © 2019 shuayb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblHello : UILabel!
    
    @IBOutlet var lblText : UILabel!
    
    var num1 : NSInteger = 0
    var num2 : NSInteger = 0
    var answer : Double = 0.0
    
    var operand : NSInteger = 0
    
    let PLUS = 10
    let MINUS = 11
    let MULTIPLY = 12
    let DIVIDE = 13
    
    var theNumber : String = "0"
    
    @IBAction func pressNum(sender : UIButton)
    {
        if sender.tag >= 0 && sender.tag < 10
        {
            theNumber += String(sender.tag)
            printNumber()
        }
    }
    
    func printNumber(){
        lblText.text = theNumber
    }
    
    
    @IBAction func clickMe (sender : Any)
    {
        lblHello.text = "lets begin"
        
    }
    
    @IBAction func setOperand(sender : UIButton)
    {
        if sender.tag >= 10 && sender.tag <= 13 {
            operand = sender.tag
            saveNum1()
        }
        if sender.tag == -2{
            theNumber = "0"
            printNumber()
        }
        
    }
    
    @IBAction func calculate(sender : UIButton)
    {
        num2 = Int(theNumber)!
        
        if operand == PLUS{
            answer = Double(num1 + num2)
        }
        if operand == MINUS{
            answer = Double(num1 - num2)
        }
        if operand == MULTIPLY{
            answer = Double(num1 * num2)
        }
        if operand == DIVIDE{
            
            if num2 == 0 {
                
                let alert = UIAlertController(title: "Error", message: "cannot divide by zero", preferredStyle: .actionSheet)
                let cancelAction = UIAlertAction (title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(cancelAction)
                present(alert,animated: true)
            } else{
                answer = Double(Double(num1) / Double(num2))
            }
        }
        
        num1 = 0
        num2 = 0
        operand = PLUS
        
        theNumber = String(answer)
        printNumber()
        
        answer = 0.0
        theNumber = "0"
    }
    
    func saveNum1(){
        num1 = Int(theNumber)!
        theNumber = "0"
        printNumber()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        printNumber()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

