//
//  ViewController.swift
//  Calculator
//
//  Created by Andrey Piskunov on 09.11.2022.
//
import UIKit

class ViewController: UIViewController {
    //MARK: - Views
    private let displayView = UIView()
    private let display     = UITextField()
    private let mainVStack  = UIStackView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    //MARK: - Properties
    var service: CalcService?
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       get {
          return .portrait
       }
    }

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service = CalcService(displayView: self)
        view.backgroundColor = AppColors.backgroundCalc
        
        configureAppearence()
        updateDisplay(text: "0")
    }
    //MARK: - Methods
    func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.display.text = text
        }
    }
    
    @objc func senderButton(_ sender: UIButton) {
        switch sender.tag {
        case 0...9:
            service?.numberAction(number:sender.tag)
        case 10:
            service?.spot()
        case 11:
            service?.makeResult()
        case 12:
            service?.adding()
        case 13:
            service?.subtraction()
        case 14:
            service?.increase()
        case 15:
            service?.acAction()
        case 16:
            service?.plusMinus()
        case 17:
            service?.percent()
        case 18:
            service?.division()
            
        default:
            break
        }
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
        display.textColor = .white
        display.font = UIFont.systemFont(ofSize: 80)
        
        displayView.addSubview(display)
        mainVStack.addSubview(displayView)
    }
    
    func setupLine1() {
        let line1 = createHStack(yPosition: Int(displayView.frame.height) + 0)
        
        let acButton = createButton(order: 0, title: "AC", tag: 15)
        acButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        acButton.backgroundColor = AppColors.topButtons
        acButton.setTitleColor(.black, for: .normal)
        
        let plusMinusButton = createButton(order: 1, title: "+/-", tag: 16)
        plusMinusButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        plusMinusButton.backgroundColor = AppColors.topButtons
        plusMinusButton.setTitleColor(.black, for: .normal)
        
        let percentButton = createButton(order: 2, title: "%", tag: 17)
        percentButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        percentButton.backgroundColor = AppColors.topButtons
        percentButton.setTitleColor(.black, for: .normal)
        
        let devisionButton = createButton(order: 3, title: "÷", tag: 18)
        devisionButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        devisionButton.backgroundColor = AppColors.actionButtons
        devisionButton.setTitleColor(.black, for: .normal)

        line1.addSubview(acButton)
        line1.addSubview(plusMinusButton)
        line1.addSubview(percentButton)
        line1.addSubview(devisionButton)
        
        mainVStack.addSubview(line1)
    }
    
    func setupLine2() {
        let line2 = createHStack(yPosition: Int(displayView.frame.height) + 100 + 2)
        
        let sevenButton = createButton(order: 0, title: "7", tag: 7)
        sevenButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        let eightButton = createButton(order: 1, title: "8", tag: 8)
        eightButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        let nineButton = createButton(order: 2, title: "9", tag: 9)
        nineButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        let increaseButton = createButton(order: 3, title: "×", tag: 14)
        increaseButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        increaseButton.backgroundColor = AppColors.actionButtons
        increaseButton.setTitleColor(.black, for: .normal)
        
        line2.addSubview(sevenButton)
        line2.addSubview(eightButton)
        line2.addSubview(nineButton)
        line2.addSubview(increaseButton)
        
        mainVStack.addSubview(line2)
    }
    
    func setupLine3() {
        let line3 = createHStack(yPosition: Int(displayView.frame.height) + 100 + 100 + 4)
        let fourButton = createButton(order: 0, title: "4", tag: 4)
        fourButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        let fiveButton = createButton(order: 1, title: "5", tag: 5)
        fiveButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        let sixButton = createButton(order: 2, title: "6", tag: 6)
        sixButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        let subtractButton = createButton(order: 3, title: "-", tag: 13)
        subtractButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        subtractButton.backgroundColor = AppColors.actionButtons
        subtractButton.setTitleColor(.black, for: .normal)
        
        line3.addSubview(fourButton)
        line3.addSubview(fiveButton)
        line3.addSubview(sixButton)
        line3.addSubview(subtractButton)
        
        mainVStack.addSubview(line3)
    }
    
    func setupLine4() {
        let line4 = createHStack(yPosition: Int(displayView.frame.height) + 100 + 100 + 100 + 6)
        let oneButton = createButton(order: 0, title: "1", tag: 1)
        oneButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        let twoButton = createButton(order: 1, title: "2", tag: 2)
        twoButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        let threeButton = createButton(order: 2, title: "3", tag: 3)
        threeButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        let addingButton = createButton(order: 3, title: "+", tag: 12)
        addingButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        addingButton.backgroundColor = AppColors.actionButtons
        addingButton.setTitleColor(.black, for: .normal)
        
        line4.addSubview(oneButton)
        line4.addSubview(twoButton)
        line4.addSubview(threeButton)
        line4.addSubview(addingButton)
        
        mainVStack.addSubview(line4)
    }
    
    func setupLine5() {
        let line5 = createHStack(yPosition: Int(displayView.frame.height) + 100 + 100 + 100 + 100 + 8)
        
        let zeroButton = createButton(order: 0, title: "0", tag: 0)
        zeroButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        zeroButton.frame = CGRect(x: 2,
                                  y: 0,
                                  width: (Int(Constants.screenWidth)/4) * 2 - 2,
                                  height: 100)
        
        let spotButton = createButton(order: 2, title: ",", tag: 10)
        spotButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        let equalButton = createButton(order: 3, title: "=", tag: 11)
        equalButton.addTarget(self, action: #selector(senderButton(_:)), for: .touchUpInside)
        equalButton.backgroundColor = AppColors.actionButtons
        equalButton.setTitleColor(.black, for: .normal)
        
        line5.addSubview(spotButton)
        line5.addSubview(equalButton)
        line5.addSubview(zeroButton)
        
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
        button.backgroundColor = AppColors.numberButtons
        button.titleLabel?.font = UIFont.systemFont(ofSize: 37)
        button.setTitleColor(.white, for: .normal)
        button.tag = tag
        
        return button
    }
    
    func createHStack(yPosition: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.frame = CGRect(x: 0, y: yPosition, width: Int(Constants.screenWidth), height: 100)
        
        return stack
    }
}
