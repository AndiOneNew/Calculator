//
//  ViewController.swift
//  Calculator
//
//  Created by Илья Новиков on 16.07.2021.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var result: UILabel!
    var writeNumber = false
    var firstNumber:Double = 0
    var secondNumber:Double = 0
    var mathOperator = ""
    var checkAfterPoint:Double = 0
    var dot = false
    var inputNumber:Double {
        get {
            return Double(result.text!)!
        }
        set {
            result.text = "\(newValue)"
            writeNumber = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func clearLabel(_ sender: UIButton) {
        firstNumber = 0
        secondNumber = 0
        mathOperator = ""
        result.text = "0"
        writeNumber = false
        dot = false
    }
    
    @IBAction func numbersPress(_ sender: UIButton) {
        if writeNumber {
            result.text? = result.text! + (String(sender.tag)).maxLength(length: 12)
        } else {
            result.text = (String(sender.tag)).maxLength(length: 12)
            writeNumber = true
        }
    }
    
    @IBAction func mathOperation(_ sender: UIButton) {
        mathOperator = sender.currentTitle!
        firstNumber = inputNumber
        writeNumber = false
        dot = false
    }
    
    @IBAction func equalsMathOperator(_ sender: UIButton) {
        if writeNumber{
        secondNumber = inputNumber
        }
        
        dot = false
        writeNumber = false
        
        switch mathOperator {
        case "/":
            if mathOperator == "/" {
                result.text = String(firstNumber / secondNumber)
            }
        case "*":
            if mathOperator == "*" {
                result.text = String(firstNumber * secondNumber)
            }
        case "+":
            if mathOperator == "+" {
                result.text = String(firstNumber + secondNumber)
            }
        case "-":
            if mathOperator == "-" {
                result.text = String(firstNumber - secondNumber)
            }
        default: break
        }
    }
    
    @IBAction func plusMinusNumber(_ sender: UIButton) {
        if Double(result.text!)! > 0 {
            result.text = "-" + result.text!
        } else {
            result.text!.remove(at: result.text!.startIndex)
        }
    }
    @IBAction func percentOfTheNumber(_ sender: UIButton) {
        if firstNumber == 0 {
            inputNumber = inputNumber / 100
        } else {
            secondNumber = firstNumber * inputNumber / 100
        }
    }
    
    @IBAction func dotPress(_ sender: UIButton) {
        if !dot && writeNumber {
            result.text = result.text! + "."
            dot = true
        } else if !dot && !writeNumber {
            result.text = "0."
        }
    }
}

extension String {
   func maxLength(length: Int) -> String {
       var str = self
       let nsString = str as NSString
       if nsString.length >= length {
           str = nsString.substring(with:
               NSRange(
                location: 0,
                length: nsString.length > length ? length : nsString.length)
           )
       }
       return  str
   }
}
