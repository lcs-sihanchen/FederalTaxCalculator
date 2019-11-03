//
//  ViewController.swift
//  FederalTaxCalculator
//
//  Created by Chen, Sihan on 2019-11-01.
//  Copyright © 2019 Chen, Sihan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var grossAnnualIncome: UITextField!
    
    @IBOutlet weak var answerOutput: UILabel!
    
    @IBOutlet weak var effectiveTaxRate: UILabel!
    
    @IBOutlet weak var amountOfTax: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK:Methods
    
    func taxCalculation() {
        // Reset the value
        answerOutput.text = ""
        amountOfTax.text = ""
        effectiveTaxRate.text = ""
        
        // Using guard statements to avoid invalid input
        guard let yourName = firstName.text else {
            answerOutput.text = "Please enter your name."
            return
        }
        if let yourName = firstName.text, yourName == "" {
            
            answerOutput.text = "Please enter your name."
            return
        }
        
        guard let grossAnnualIncomeAsString = grossAnnualIncome.text else
        {
            
            answerOutput.text = "Please enter a number."
            return
        }
        
        guard let grossAnnualIncomeAsDouble = Double(grossAnnualIncomeAsString) else {
            
            answerOutput.text = "Please enter a number."
            return
        }
        
        // Functions (rounding numbers, answer output)
        func roundTheNumberToTwoDigits (Number:Double) {
            let numberTimes100AsInt = Int(Number * 100)
            let numberAsDouble = Double(numberTimes100AsInt)/100
            let federalTaxAsString = String(numberAsDouble)
            amountOfTax.text = "$\(federalTaxAsString)"
        }
        
        func finalAnswerOutput() {
            answerOutput.text = "\(yourName) your federal tax owing is"
        }
        
        var federalTax = 0.0
        
        func effectiveTaxRateOne() {
            
            let effectiveTaxRateAsDouble = federalTax / grossAnnualIncomeAsDouble
            let effectiveTaxRateAsInt100 = Int(effectiveTaxRateAsDouble * 1000)
            let roundedTaxRate = Double(effectiveTaxRateAsInt100)/10
            
            effectiveTaxRate.text = "Effective tax rate is: \(roundedTaxRate)%"
        }
        
        // Calculate tax for different range
        switch grossAnnualIncomeAsDouble {
            
        case 210371... :
            federalTax += (grossAnnualIncomeAsDouble - 210371) * 0.33
            federalTax += (210371 - 147667) * 0.29
            federalTax += (147667 - 95259) * 0.26
            federalTax += (95259 - 47630) * 0.205
            federalTax += 47360 * 0.15
            roundTheNumberToTwoDigits(Number: federalTax)
            finalAnswerOutput()
            effectiveTaxRateOne()
            
        case 147667...210371:
            federalTax += (grossAnnualIncomeAsDouble - 147667) * 0.29
            federalTax += (147667 - 95259) * 0.26
            federalTax += (95259 - 47630) * 0.205
            federalTax += 47360 * 0.15
            roundTheNumberToTwoDigits(Number: federalTax)
            finalAnswerOutput()
            effectiveTaxRateOne()
            
            
        case 95259...147667:
            federalTax += (grossAnnualIncomeAsDouble - 95259) * 0.26
            federalTax += (95259 - 47630) * 0.205
            federalTax += 47360 * 0.15
            roundTheNumberToTwoDigits(Number: federalTax)
            finalAnswerOutput()
            effectiveTaxRateOne()
            
            
        case 47630...95259:
            federalTax += (grossAnnualIncomeAsDouble - 47630) * 0.205
            federalTax += 47360 * 0.15
            roundTheNumberToTwoDigits(Number: federalTax)
            finalAnswerOutput()
            effectiveTaxRateOne()
            
            
        case 0...47630:
            federalTax += grossAnnualIncomeAsDouble * 0.15
            roundTheNumberToTwoDigits(Number: federalTax)
            finalAnswerOutput()
            effectiveTaxRateOne()
            
            
        default:
            answerOutput.text = "Please type in a valid number."
        }
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    // Action
    
    @IBAction func CalculateTax(_ sender: UIButton) {
        
        taxCalculation()
    }
    
    
    
    
    
    
    
}




//Current federal tax rates are:
//○ 15% on the first $47,630 of taxable income
//○ 20.5% on the next $47,629 of taxable income (on the portion of taxable income
//over 47,630 up to and including $95,259), plus
//○ 26% on the next $52,408 of taxable income (on the portion of taxable income
//over $95,259 up to and including $147,667), plus
//○ 29% on the next $62,704 of taxable income (on the portion of taxable income
//over 147,667 up to and including $210,371), plus
//○ 33% of taxable income over $210,371
