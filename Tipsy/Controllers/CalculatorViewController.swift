//
//  ViewController.swift
//  Tipsy
//
//  Created by Eduard Tokarev on 24.02.2023.
//

import UIKit

final class CalculatorViewController: UIViewController {
    @IBOutlet private weak var billTextField: UITextField!
    @IBOutlet private weak var zeroPctButton: UIButton!
    @IBOutlet private weak var tenPctButton: UIButton!
    @IBOutlet private weak var twentyPctButton: UIButton!
    @IBOutlet private weak var splitNumberLabel: UILabel!
    private var tip = 0.10
    private var numberOfPeople = 2
    private var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        [zeroPctButton, tenPctButton, twentyPctButton].forEach { item in
            item?.isSelected = false
        }
        sender.isSelected = true
        
        if let buttonTitle = sender.currentTitle {
            let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
            if let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign) {
                tip = buttonTitleAsANumber / 100
            }
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let bill = billTextField.text {
            if let billDouble = Double(bill) {
                let result = billDouble * (1 + tip) / Double(numberOfPeople)
                finalResult = String(format: "%.2f", result)
            }
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            guard let destinationVC = segue.destination as? ResultsViewController
            else { fatalError("Failed to prepare for goToResults ")}
            
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
}

