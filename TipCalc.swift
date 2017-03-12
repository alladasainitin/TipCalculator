//
//  TipCalc.swift
//  TipCalculation_
//
//  Created by ALLADA SAI NITIN on 3/11/17.
//  Copyright © 2017 ALLADA SAI NITIN. All rights reserved.
//

import Foundation

class TipCalc
{
    
    var TipAmount: Float = 0
    var BillAmountBefore: Float = 0
    var tipPercentage: Float = 0
    var TotalAmount: Float = 0
    
    init(BillAmountBefore: Float, tipPercentage: Float)
    {
        self.BillAmountBefore = BillAmountBefore
        self.tipPercentage = tipPercentage
    }
    
    func CalculateTip()
    {
        TipAmount = BillAmountBefore * tipPercentage/100
        TotalAmount = BillAmountBefore + TipAmount
    }
    
    
    
}
