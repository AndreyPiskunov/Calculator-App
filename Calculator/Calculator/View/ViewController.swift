//
//  ViewController.swift
//  Calculator
//
//  Created by Andrey Piskunov on 09.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    var service: CalcService?

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        service = CalcService(displayView: self)
        view.backgroundColor = .systemRed
    }
    
    //MARK: - Functions
    func updateDisplay(text: String){
        print(text)
    }
}

