//
//  TipCalculatorViewController.swift
//  TipCalculation_
//
//  Created by ALLADA SAI NITIN on 3/11/17.
//  Copyright © 2017 ALLADA SAI NITIN. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var TipPercentageSlider: UISlider!
    @IBOutlet weak var TipPercentageLabel: UILabel!
    @IBOutlet weak var BillAmountTextField: UITextField!

    @IBOutlet weak var IndividualCount: UITextField!
    
    @IBOutlet weak var NumberOfPeopleLabel: UILabel!
    @IBOutlet weak var ResultsLabel: UILabel!
    @IBOutlet weak var ResultLabel: UITextField!
    @IBOutlet weak var IndividualCountLabel: UISlider!
  
    @IBOutlet weak var SplitResultLabel: UILabel!
    
    @IBOutlet weak var SummaryButton: UIBarButtonItem!
   
    
    @IBAction func SummaryKey(_ sender: AnyObject) {
        
    }
    @IBAction func SummaryButton(_ sender: AnyObject) {
        
    }

    // Property
    
    var tipCalc = TipCalc(BillAmountBefore: 0, tipPercentage: 0.15)


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Tip.png")!)
        
        BillAmountTextField.text = String(format: "%0.2f", arguments: [tipCalc.BillAmountBefore])
        TipPercentageLabel.text = String(format: "Tip %d%%:", arguments: [Int(tipCalc.tipPercentage * 100)])
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ReceiptButton(_ sender: AnyObject) {
    
    }
    
    
    @IBAction func Button(_ sender: AnyObject) {
        
        let _BillAmount = BillAmountTextField.text
        let _NumberOfPeople = NumberOfPeopleLabel.text
        let _SplitPay = SplitResultLabel.text
        
        performSegue(withIdentifier: "SummaryVC", sender: _BillAmount)
        performSegue(withIdentifier: "SummaryVC", sender: _NumberOfPeople)
        performSegue(withIdentifier: "SummaryVC", sender: _SplitPay)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SummaryViewController{
            if let name = sender as? String
            {
                destinationVC.Bill = name
        }
    
    }
}
    
    

    @IBAction func Tap(_ sender: AnyObject) {
        
        view.endEditing(true)
    }
    func calcTip()
    {
        tipCalc.tipPercentage = Float(TipPercentageSlider.value)
        tipCalc.BillAmountBefore = Float(BillAmountTextField.text!)!
        tipCalc.CalculateTip()
        UpdateUI()
    }
    
    func UpdateUI()
    {
        ResultsLabel.text = String(format: "Total: %0.2f  Tip: %0.2f", arguments: [tipCalc.TotalAmount, tipCalc.TipAmount])
        let x = Int(IndividualCountLabel.value)
        SplitResultLabel.text = String(format: "You Pay = %0.2f", arguments: [(tipCalc.TotalAmount)/Float(x)])
    }


    @IBAction func BillAmountTextFieldChanged(_ sender: AnyObject) {
        
        calcTip()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == BillAmountTextField{
            textField.resignFirstResponder()
            calcTip()
        }
        return true
    }
    
    @IBAction func TipPercentageSliderChanged(_ sender: Any) {
        
        TipPercentageLabel.text! = String(format: "Tip %0.2f%%:", arguments: [Float(TipPercentageSlider.value)])
        calcTip()
    }
    
    
    @IBAction func NumberOfPeopleSliderChanged(_ sender: AnyObject) {
        
        NumberOfPeopleLabel.text! = String(format: " Split for: %2d People", arguments: [Int(IndividualCountLabel.value)])
        calcTip()
    }
    
   
    
    
    

}
