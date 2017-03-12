//
//  SummaryViewController.swift
//  TipCalculation_
//
//  Created by ALLADA SAI NITIN on 3/11/17.
//  Copyright © 2017 ALLADA SAI NITIN. All rights reserved.
//

import UIKit

protocol DestinationViewDelegate {
    func setColor(colorName: String);
}

class SummaryViewController: UIViewController {
    
    
    private var _BillAmount = String()
    var Bill : String
        {
        get{
            return _BillAmount
        } set{
            _BillAmount = newValue
        }
    }
    
    
    
    private var _NumberOfPeople = String()
    var People : String
        {
        get{
            return _NumberOfPeople
        } set{
            _NumberOfPeople = newValue
        }
    }
    
    private var _SplitPay = String()
    var Split : String
        {
        get{
            return _SplitPay
        } set{
            _SplitPay = newValue
        }
    }
    
    
    @IBOutlet weak var TotalBillLabel: UILabel!
    @IBOutlet weak var FriendsCountLabel: UILabel!
    @IBOutlet weak var YourPayLabel: UILabel!
    
    // var TotalBillLabelText = Int()
    // var FriendsCountLabeText = Int()
    // var YourPayLabelText = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TotalBillLabel.text = _BillAmount

        //TotalBillLabel.text = TotalBillLabelText
        //FriendsCountLabel.text = FriendsCountLabelText
        //YourPayLabel.text = YourPayLabelText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
