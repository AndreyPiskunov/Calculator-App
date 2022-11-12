//
//  CalcService.swift
//  Calculator
//
//  Created by Andrey Piskunov on 09.11.2022.
//

import Foundation

class CalcService {
    // MARK: - Properties
    
    var isRunning = true
    var firstNumber = 0.0
    var secondNumber = 0.0
    var currentNumber = "0"
    var result = ""
    var currentOperation = Operations.noAction
    var displayView: ViewController
    
    // MARK: - Methods
    init(displayView: ViewController){
        self.displayView = displayView
    }

    func numberAction(number: Int) {
        if currentNumber != "0" {
            currentNumber.append(String(number))
            displayView.updateDisplay(text: currentNumber)
        } else {
            currentNumber = String(number)
            displayView.updateDisplay(text: currentNumber)
        }
    }
    
    func makeCalculation(operation: Operations) {
        if currentOperation != .noAction {
            if currentNumber != "" {
                secondNumber = Double(currentNumber) ?? 0.0
                
                switch operation {
                case .adding:
                    result = String(firstNumber + secondNumber)
                case .subtraction:
                    result = String(firstNumber - secondNumber)
                case .increase:
                    result = String(firstNumber * secondNumber)
                case .division:
                    result = String(firstNumber / secondNumber)
                default:
                    break
                }
                
                firstNumber = Double(result)!
                
                if Double(result)!.truncatingRemainder(dividingBy: 1) == 0 {
                    result = String(Int(Double(result)!))
                }
                currentNumber = result
                displayView.updateDisplay(text: currentNumber)
                currentOperation = .noAction
            }
        } else {
            firstNumber = Double(currentNumber) ?? 0.0
            currentNumber = ""
            displayView.updateDisplay(text: "")
            currentOperation = operation
        }
    }
    
    func adding() {
        makeCalculation(operation: .adding)
    }
    
    func subtraction() {
        if (currentNumber == "0") || (currentNumber == "") {
            currentNumber = "-"
            displayView.updateDisplay(text: currentNumber)
        } else {
            
            makeCalculation(operation: .subtraction)
        }
    }
    
    func increase() {
        makeCalculation(operation: .increase)
    }
    
    func division() {
        makeCalculation(operation: .division)
    }
    
    func makeResult() {
        makeCalculation(operation: currentOperation)
    }
    
    func acAction() {
        firstNumber = 0.0
        secondNumber = 0.0
        currentNumber = "0"
        result = ""
        currentOperation = Operations.noAction
        displayView.updateDisplay(text: currentNumber)
    }
    
    func spot() {
        if currentNumber.contains(",") {
            return
        } else {
            currentNumber += "."
            displayView.updateDisplay(text: currentNumber)
        }
    }
    
    func plusMinus() {
        var temp = currentNumber
        if temp.contains("-") {
            let sign = ["-"]
            temp = String(temp.filter { !sign.contains(String($0)) })
            displayView.updateDisplay(text: temp)
            currentNumber = temp
        } else {
            temp = "-" + currentNumber
            displayView.updateDisplay(text: temp)
            currentNumber = temp
        }
        
    }
    
    func percent() {
            currentNumber = String(Double(currentNumber)! / 100)
            displayView.updateDisplay(text: currentNumber)
            result = currentNumber
            firstNumber = Double(result)!
    }
}
