//
//  ViewController.swift
//  Calculator_task
//
//  Copyright (c) 2014 Milchevskiy Pogrebnyak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isTypingDigit = false
    var OpEnd = false
    var firstDigit = 0
    var operation = ""
    var previousdig = 0
    
    
    @IBOutlet weak var CalcDisplay: UILabel!

    @IBOutlet weak var CalculDisp: UILabel!
    
    @IBOutlet weak var PreviousDigit: UILabel!
    
    @IBAction func CalculationChoosed(sender: AnyObject) {
        let calc = sender.currentTitle
        
        isTypingDigit = false
        
        operation = sender.currentTitle!!
        CalculDisp.text = calc!
        PreviousDigit.text = PreviousDigit.text! + calc!!
        
        
    }
    @IBAction func ChooseDigit(sender: AnyObject) {
        let digit = sender.currentTitle
        
        if OpEnd{
            PreviousDigit.text = ""
            CalculDisp.text = ""
        }
        
        PreviousDigit.text = PreviousDigit.text! + String(digit!!)
        
        
        if isTypingDigit{
            CalcDisplay.text = CalcDisplay.text! + digit!!
        } else {
            
            CalcDisplay.text = digit
            isTypingDigit = true
    
               }
        Calculation()
        OpEnd = false
            }

    @IBAction func Equals(sender: AnyObject) {
        isTypingDigit = false
        CalcDisplay.text = "\(previousdig)"
        CalculDisp.text = "="
        operation = ""
        firstDigit = 0
        previousdig = 0
        OpEnd = true
    }
    
    func Calculation()
    {
            firstDigit = CalcDisplay.text!.toInt()!
        
            switch operation
            {
            case "+": previousdig = firstDigit + previousdig
                
            case "-": previousdig = previousdig - firstDigit
                
            case "*": previousdig = firstDigit * previousdig
                
            case "/": previousdig =  previousdig/firstDigit
                
            default: previousdig = firstDigit
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

