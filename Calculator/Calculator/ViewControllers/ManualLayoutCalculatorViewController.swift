//
//  ManualLayoutCalculatorViewController.swift
//  Calculator
//
//  Created by Nickolai Nikishin on 13.11.21.
//

import UIKit

class ManualLayoutCalculatorViewController: AbstractCalculatorViewController {
    
    override var displayLabel: UILabel! {
        set {
            
        }
        
        get {
            return manualDisplayLabel
        }
    }
    
    let manualDisplayLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        createUI()
    }
    
    func createUI() {
        addButtons()
    }
    
    func addButtons() {
        let equalButton = BinaryOperatorButton(type: .custom)
        equalButton.addTarget(self, action: #selector(equalOperatorButtonTapped), for: .touchUpInside)
        equalButton.setTitle("=", for: .normal)
        equalButton.setTitleColor(equalButton.selectedColor, for: .normal)
        equalButton.setTitleColor(equalButton.defaultColor, for: .selected)
        equalButton.backgroundColor = equalButton.defaultColor
        equalButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        
        equalButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(equalButton)
        
        NSLayoutConstraint.activate([
            equalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            equalButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            equalButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25, constant: -25),
            equalButton.heightAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        
        let decimalSeparatorButton = DigitButton(type: .custom)
        decimalSeparatorButton.addTarget(self, action: #selector(decimalSeparatorButtonTapped), for: .touchUpInside)
        decimalSeparatorButton.setTitle(CalculatorLogic.formatter.decimalSeparator, for: .normal)
        decimalSeparatorButton.setTitleColor(DigitButton.defaultTextColor, for: .normal)
        decimalSeparatorButton.backgroundColor = DigitButton.defaultBackgroundColor
        decimalSeparatorButton.titleLabel?.font = DigitButton.font
        decimalSeparatorButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(decimalSeparatorButton)
        
        NSLayoutConstraint.activate([
            decimalSeparatorButton.trailingAnchor.constraint(equalTo: equalButton.leadingAnchor, constant: -20),
            decimalSeparatorButton.bottomAnchor.constraint(equalTo: equalButton.bottomAnchor),
            decimalSeparatorButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            decimalSeparatorButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let digit0Button = DigitButton.generate(title: "0")
        digit0Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit0Button)
        
        NSLayoutConstraint.activate([
            digit0Button.trailingAnchor.constraint(equalTo: decimalSeparatorButton.leadingAnchor, constant: -20),
            digit0Button.bottomAnchor.constraint(equalTo: equalButton.bottomAnchor),
            digit0Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            digit0Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let digit1Button = DigitButton.generate(title: "1")
        digit1Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit1Button)
        
        NSLayoutConstraint.activate([
            digit1Button.bottomAnchor.constraint(equalTo: digit0Button.topAnchor, constant: -20),
            digit1Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            digit1Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            digit1Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let digit2Button = DigitButton.generate(title: "2")
        digit2Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit2Button)
        
        NSLayoutConstraint.activate([
            digit2Button.bottomAnchor.constraint(equalTo: digit0Button.topAnchor, constant: -20),
            digit2Button.leadingAnchor.constraint(equalTo: digit1Button.trailingAnchor, constant: 20),
            digit2Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            digit2Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let digit3Button = DigitButton.generate(title: "3")
        digit3Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit3Button)
        
        NSLayoutConstraint.activate([
            digit3Button.bottomAnchor.constraint(equalTo: decimalSeparatorButton.topAnchor, constant: -20),
            digit3Button.leadingAnchor.constraint(equalTo: digit2Button.trailingAnchor, constant: 20),
            digit3Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            digit3Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let digit4Button = DigitButton.generate(title: "4")
        digit4Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit4Button)
        
        NSLayoutConstraint.activate([
            digit4Button.bottomAnchor.constraint(equalTo: digit1Button.topAnchor, constant: -20),
            digit4Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            digit4Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            digit4Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let digit5Button = DigitButton.generate(title: "5")
        digit5Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit5Button)
        
        NSLayoutConstraint.activate([
            digit5Button.bottomAnchor.constraint(equalTo: digit2Button.topAnchor, constant: -20),
            digit5Button.leadingAnchor.constraint(equalTo: digit4Button.trailingAnchor, constant: 20),
            digit5Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            digit5Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let digit6Button = DigitButton.generate(title: "6")
        digit6Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit6Button)
        
        NSLayoutConstraint.activate([
            digit6Button.bottomAnchor.constraint(equalTo: digit3Button.topAnchor, constant: -20),
            digit6Button.leadingAnchor.constraint(equalTo: digit5Button.trailingAnchor, constant: 20),
            digit6Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            digit6Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let digit7Button = DigitButton.generate(title: "7")
        digit7Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit7Button)
        
        NSLayoutConstraint.activate([
            digit7Button.bottomAnchor.constraint(equalTo: digit4Button.topAnchor, constant: -20),
            digit7Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            digit7Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            digit7Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let digit8Button = DigitButton.generate(title: "8")
        digit8Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit8Button)
        
        NSLayoutConstraint.activate([
            digit8Button.bottomAnchor.constraint(equalTo: digit5Button.topAnchor, constant: -20),
            digit8Button.leadingAnchor.constraint(equalTo: digit7Button.trailingAnchor, constant: 20),
            digit8Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            digit8Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let digit9Button = DigitButton.generate(title: "9")
        digit9Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit9Button)
        
        NSLayoutConstraint.activate([
            digit9Button.bottomAnchor.constraint(equalTo: digit6Button.topAnchor, constant: -20),
            digit9Button.leadingAnchor.constraint(equalTo: digit8Button.trailingAnchor, constant: 20),
            digit9Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            digit9Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        

        let plusButton = BinaryOperatorButton(type: .custom)
        plusButton.addTarget(self, action: #selector(binaryOperandButtonTapped), for: .touchUpInside)
        plusButton.tag = 102
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(plusButton.selectedColor, for: .normal)
        plusButton.setTitleColor(plusButton.defaultColor, for: .selected)
        plusButton.backgroundColor = plusButton.defaultColor
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)

        plusButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(plusButton)

        NSLayoutConstraint.activate([
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            plusButton.bottomAnchor.constraint(equalTo: equalButton.topAnchor, constant: -20),
            plusButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            plusButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let minusButton = BinaryOperatorButton(type: .custom)
        minusButton.addTarget(self, action: #selector(binaryOperandButtonTapped), for: .touchUpInside)
        minusButton.tag = 103
        minusButton.setTitle("\u{2212}", for: .normal)
        minusButton.setTitleColor(minusButton.selectedColor, for: .normal)
        minusButton.setTitleColor(minusButton.defaultColor, for: .selected)
        minusButton.backgroundColor = minusButton.defaultColor
        minusButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)

        minusButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(minusButton)

        NSLayoutConstraint.activate([
            minusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            minusButton.bottomAnchor.constraint(equalTo: plusButton.topAnchor, constant: -20),
            minusButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            minusButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let multiplyButton = BinaryOperatorButton(type: .custom)
        multiplyButton.addTarget(self, action: #selector(binaryOperandButtonTapped), for: .touchUpInside)
        multiplyButton.tag = 100
        multiplyButton.setTitle("\u{00D7}", for: .normal)
        multiplyButton.setTitleColor(multiplyButton.selectedColor, for: .normal)
        multiplyButton.setTitleColor(multiplyButton.defaultColor, for: .selected)
        multiplyButton.backgroundColor = multiplyButton.defaultColor
        multiplyButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)

        multiplyButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(multiplyButton)

        NSLayoutConstraint.activate([
            multiplyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            multiplyButton.bottomAnchor.constraint(equalTo: minusButton.topAnchor, constant: -20),
            multiplyButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            multiplyButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let devideButton = BinaryOperatorButton(type: .custom)
        devideButton.addTarget(self, action: #selector(binaryOperandButtonTapped), for: .touchUpInside)
        devideButton.tag = 101
        devideButton.setTitle("\u{00F7}", for: .normal)
        devideButton.setTitleColor(devideButton.selectedColor, for: .normal)
        devideButton.setTitleColor(devideButton.defaultColor, for: .selected)
        devideButton.backgroundColor = devideButton.defaultColor
        devideButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)

        devideButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(devideButton)

        NSLayoutConstraint.activate([
            devideButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            devideButton.bottomAnchor.constraint(equalTo: multiplyButton.topAnchor, constant: -20),
            devideButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            devideButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])

        let percentButton = UnaryOperandButton(type: .custom)
        percentButton.addTarget(self, action: #selector(unaryOperatorButtonTapped), for: .touchUpInside)
        percentButton.tag = 201
        percentButton.setTitle("\u{0025}", for: .normal)
        percentButton.setTitleColor(percentButton.textColor, for: .normal)
        percentButton.backgroundColor = percentButton.background1Color
        percentButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)

        percentButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(percentButton)

        NSLayoutConstraint.activate([
            percentButton.trailingAnchor.constraint(equalTo: devideButton.leadingAnchor, constant: -20),
            percentButton.bottomAnchor.constraint(equalTo: digit9Button.topAnchor, constant: -20),
            percentButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            percentButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let invertButton = UnaryOperandButton(type: .custom)
        invertButton.addTarget(self, action: #selector(unaryOperatorButtonTapped), for: .touchUpInside)
        invertButton.tag = 202
        invertButton.setTitle("\u{00B1}", for: .normal)
        invertButton.setTitleColor(invertButton.textColor, for: .normal)
        invertButton.backgroundColor = invertButton.background1Color
        invertButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)

        invertButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(invertButton)

        NSLayoutConstraint.activate([
            invertButton.trailingAnchor.constraint(equalTo: percentButton.leadingAnchor, constant: -20),
            invertButton.bottomAnchor.constraint(equalTo: digit8Button.topAnchor, constant: -20),
            invertButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            invertButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let clearButton = UnaryOperandButton(type: .custom)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        clearButton.setTitle("AC", for: .normal)
        clearButton.setTitleColor(clearButton.textColor, for: .normal)
        clearButton.backgroundColor = clearButton.background1Color
        clearButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)

        clearButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(clearButton)

        NSLayoutConstraint.activate([
            clearButton.trailingAnchor.constraint(equalTo: invertButton.leadingAnchor, constant: -20),
            clearButton.bottomAnchor.constraint(equalTo: digit7Button.topAnchor, constant: -20),
            clearButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            clearButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        manualDisplayLabel.font = UIFont.systemFont(ofSize: 70)
        manualDisplayLabel.textAlignment = .right
        manualDisplayLabel.textColor = .white
        manualDisplayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(manualDisplayLabel)
        
        NSLayoutConstraint.activate([
            manualDisplayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            manualDisplayLabel.bottomAnchor.constraint(equalTo: devideButton.topAnchor, constant: -20),
            manualDisplayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
}
