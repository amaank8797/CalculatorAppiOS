//
//  ViewController.swift
//  Calculator
//
//  Created by Amaan Amaan on 14/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorWorkings: UILabel!
    
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func allClearButton(_ sender: Any) {
        clearCalculator()
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        deleteLastCharacter()
    }
    
    @IBAction func percentButton(_ sender: Any) {
        appendSymbol("%")
    }
    
    @IBAction func divideButton(_ sender: Any) {
        appendSymbol("/")
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        appendSymbol("*")
    }
    
    @IBAction func minusButton(_ sender: Any) {
        appendSymbol("-")
    }
    
    @IBAction func plusButton(_ sender: Any) {
        appendSymbol("+")
    }
    
    @IBAction func equalButton(_ sender: Any) {
        calculateResult()
    }
    
    
    @IBAction func decimalButton(_ sender: Any) {
        appendSymbol(".")
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        appendNumber("0")
    }
    
    @IBAction func oneButton(_ sender: Any) {
        appendNumber("1")   
    }
    
    @IBAction func twoButton(_ sender: Any) {
        appendNumber("2")
    }
    
    @IBAction func threeButton(_ sender: Any) {
        appendNumber("3")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        appendNumber("4")   
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        appendNumber("5")   
    }
    
    @IBAction func sixButton(_ sender: Any) {
        appendNumber("6")
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        appendNumber("7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        appendNumber("8")
    }
    
    @IBAction func nineButton(_ sender: Any) {
        appendNumber("9")
    }
    
    
    func appendSymbol(_ symbol: String) {
            workings.append(symbol)
            calculatorWorkings.text = workings
        }
        
        func appendNumber(_ number: String) {
            workings.append(number)
            calculatorWorkings.text = workings
        }
        
        func deleteLastCharacter() {
            guard !workings.isEmpty else { return }
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    func clearCalculator() {
           workings = ""
           calculatorWorkings.text = ""
           calculatorResults.text = ""
       }
       
    func calculateResult() {
        // Replace ÷ with / for division
        let expressionString = workings.replacingOccurrences(of: "÷", with: "/")
        
        // Check for division by zero
        if expressionString.contains("/0") {
            calculatorResults.text = "Error"
            return
        }
        
        // Evaluate the expression
        let expression = NSExpression(format: expressionString)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            if result.isFinite {
                calculatorResults.text = "\(result)"
            } else {
                calculatorResults.text = "Error"
            }
        } else {
            calculatorResults.text = "Error"
        }
    }



}

