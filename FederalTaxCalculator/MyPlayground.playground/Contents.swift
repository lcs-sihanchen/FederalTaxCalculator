import UIKit

var str = "Hello, playground"


let grossAnnualIncome = 289042.0
var federalTax = 0.0
switch grossAnnualIncome {
case 210371... :
    federalTax += (grossAnnualIncome - 210371) * 0.33
    federalTax += (210371 - 147667) * 0.29
    federalTax += (147667 - 95259) * 0.26
    federalTax += (95259 - 47630) * 0.205
    federalTax += 47360 * 0.15
case 147667...210371:
    federalTax += (grossAnnualIncome - 147667) * 0.29
    federalTax += (147667 - 95259) * 0.26
    federalTax += (95259 - 47630) * 0.205
    federalTax += 47360 * 0.15
    
case 95259...147667:
    federalTax += (grossAnnualIncome - 95259) * 0.26
    federalTax += (95259 - 47630) * 0.205
    federalTax += 47360 * 0.15
    
case 47630...95259:
    federalTax += (grossAnnualIncome - 47630) * 0.205
    federalTax += 47360 * 0.15
case 0...47630:
    federalTax += grossAnnualIncome * 0.15
    
default:
    print("Try a valid number")
    
    
    
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

