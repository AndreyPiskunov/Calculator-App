//
//  ViewController.swift
//  Calculator
//
//  Created by Andrey Piskunov on 09.11.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - View
    private let displayView = UIView()
    private let display     = UITextField()
    private let mainVStack  = UIStackView()
    
    //MARK: - Properties
    var service: CalcService?

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service = CalcService(displayView: self)
        view.backgroundColor = .systemRed
        
        configureAppearence()
    }
    //MARK: - Methods
    func updateDisplay(text: String){
        DispatchQueue.main.async {
            self.display.text = text
            
        }
        print(text)
    }
}
    //MARK: - Private methods
private extension ViewController {
    func configureAppearence() {
        setupDisplayView()
        setupButtons()
        setupMainVStack()
    }
    
    func setupMainVStack() {
        mainVStack.axis = .vertical
        mainVStack.frame = CGRect(x: 0, y: 60, width: Constants.screenWidth, height: Constants.screenHeight - 60)
        self.view.addSubview(mainVStack)
        
        mainVStack.backgroundColor = .systemGreen
     
    }
    
    func setupDisplayView() {
        displayView.frame = CGRect(x: 0, y: 0, width: Constants.screenWidth, height: Constants.screenHeight - (102*5) - 60 - 30)
        displayView.backgroundColor = .clear
        display.frame = CGRect(x: 15,
                               y: 15,
                               width: displayView.frame.width - 30,
                               height: displayView.frame.height - 15)
        display.textAlignment = .right
        display.contentVerticalAlignment = .bottom
        display.text = "0"
        display.textColor = .black
        display.font = UIFont.systemFont(ofSize: 80)
        display.backgroundColor = .white
        
        displayView.addSubview(display)
        mainVStack.addSubview(displayView)
    }
    
    func setupLine1() {
        let line1 = createHStack(yPosition: Int(displayView.frame.height) + 0)
        line1.addSubview(createButton(order: 0, title: "AC", tag: 15))
        line1.addSubview(createButton(order: 1, title: "+/-", tag: 16))
        line1.addSubview(createButton(order: 2, title: "%", tag: 17))
        line1.addSubview(createButton(order: 3, title: "÷", tag: 18))
        mainVStack.addSubview(line1)
    }
    
    func setupLine2() {
        let line2 = createHStack(yPosition: Int(displayView.frame.height) + 100 + 2)
        line2.addSubview(createButton(order: 0, title: "7", tag: 7))
        line2.addSubview(createButton(order: 1, title: "8", tag: 8))
        line2.addSubview(createButton(order: 2, title: "9", tag: 9))
        line2.addSubview(createButton(order: 3, title: "×", tag: 14))
        mainVStack.addSubview(line2)
    }
    
    func setupLine3() {
        let line3 = createHStack(yPosition: Int(displayView.frame.height) + 100 + 100 + 4)
        line3.addSubview(createButton(order: 0, title: "4", tag: 4))
        line3.addSubview(createButton(order: 1, title: "5", tag: 5))
        line3.addSubview(createButton(order: 2, title: "6", tag: 6))
        line3.addSubview(createButton(order: 3, title: "-", tag: 13))
        mainVStack.addSubview(line3)
    }
    
    func setupLine4() {
        let line4 = createHStack(yPosition: Int(displayView.frame.height) + 100 + 100 + 100 + 6)
        line4.addSubview(createButton(order: 0, title: "1", tag: 1))
        line4.addSubview(createButton(order: 1, title: "2", tag: 2))
        line4.addSubview(createButton(order: 2, title: "3", tag: 3))
        line4.addSubview(createButton(order: 3, title: "+", tag: 12))
        mainVStack.addSubview(line4)
    }
    
    func setupLine5() {
        let line5 = createHStack(yPosition: Int(displayView.frame.height) + 100 + 100 + 100 + 100 + 8)
        
        let zeroButton = createButton(order: 0, title: "0", tag: 0)
        zeroButton.frame = CGRect(x: 2,
                                  y: 0,
                                  width: (Int(Constants.screenWidth)/4) * 2 - 2,
                                  height: 100)
        line5.addSubview(zeroButton)
        
        line5.addSubview(createButton(order: 2, title: ",", tag: 10))
        line5.addSubview(createButton(order: 3, title: "=", tag: 11))
        mainVStack.addSubview(line5)
    }
    
    func setupButtons() {
        setupLine1()
        setupLine2()
        setupLine3()
        setupLine4()
        setupLine5()
    }
    
    func createButton(order: Int, title: String, tag: Int) -> UIButton {
        
        let button = UIButton(frame: CGRect(x: (0 + Int(Constants.screenWidth/4) * order + 2),
                                            y: 0,
                                            width: Int(Constants.screenWidth)/4-2,
                                            height: 100))
        button.setTitle(title, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }
    
    func createHStack(yPosition: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.frame = CGRect(x: 0, y: yPosition, width: Int(Constants.screenWidth), height: 100)
        
        return stack
    }
}


