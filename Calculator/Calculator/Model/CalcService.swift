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
    
    init(displayView: ViewController){
        self.displayView = displayView
    }
    
    // MARK: - Methods
    
    func updateDisplay(text: String){
        print(text)
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
            }
        } else {
            firstNumber = Double(currentNumber) ?? 0.0
            currentNumber = ""
            updateDisplay(text: currentNumber)
            currentOperation = operation
        }
        print()
    }
    
    func adding() {
        makeCalculation(operation: .adding)
    }
    
    func subtraction() {
        makeCalculation(operation: .subtraction)
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
    }
}
