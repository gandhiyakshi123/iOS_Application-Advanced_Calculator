//
//  TempViewController.swift
//  CALCUALTOR
//
//  Created by Nishtha Patel 
//

import UIKit

class TempViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var txtInputNum: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var fromValueLbl: UILabel!
    @IBOutlet weak var toValueLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Declaring local Variables for FROM button
    var from:String = ""
    
    // Declaring local Variables for TO button
    var to:String = ""
    
    //Actions for FROM buttons
    @IBAction func fromBtnK(_ sender: UIButton) {
        from = "kelvin"
        fromValueLbl.text = from
    }
    @IBAction func fromBtnC(_ sender: UIButton) {
            from = "celsius"
        fromValueLbl.text = from
    }
    
    @IBAction func fromBtnF(_ sender: UIButton) {
        from = "fahrenheit"
        fromValueLbl.text = from
    }
    
//    Actions for TO buttons
    @IBAction func toBtnK(_ sender: UIButton) {
        to = "kelvin"
        toValueLbl.text = to
    }

    @IBAction func toBtnC(_ sender: UIButton) {
        to = "celsius"
        toValueLbl.text = to
    }
    
    @IBAction func toBtnF(_ sender: UIButton) {
        to = "fahrenheit"
        toValueLbl.text = to
    }
    
    //loacl variables
    var number: String = ""
    var result:Double = 0
    
    
    //get the number from the user
    @IBAction func numberPressed(_ sender: UIButton) {
        number += String(sender.tag)
        txtInputNum.text = number
    }
    
    @IBAction func dotBtnPressed(_ sender: UIButton) {
        if (txtInputNum.text!.count == 0){
            number = "0."
            txtInputNum.text = number
        }
        else{
            if txtInputNum.text!.range(of: ".") == nil{
                number = txtInputNum.text! + "."
                txtInputNum.text = number
            }
        }
    }
    
    //Getting result based on different selected units
    func getResult() -> Double {
        if(Double(txtInputNum.text!) == nil){
            txtInputNum.text = "0"
        }
        if(from != "" && to != "" && from == to){
            result = Double(txtInputNum.text!)!
            lblResult.text = String(result)
            return Double(lblResult.text!)!
        }
        else if(from == "kelvin"){
            switch(to){
            case "celsius":
                result = Double(txtInputNum.text!)! - 273.15
            case "fahrenheit":
                result = Double(txtInputNum.text!)! - 273.15 * 9/5 + 32

            default:
                0
            }
        }
        else if(from == "celsius"){
            switch(to){
            case "kelvin":
                result = Double(txtInputNum.text!)! + 273.15
            case "fahrenheit":
                result = Double(txtInputNum.text!)! * 9/5 + 32
            
            default:
                0
            }
        }
        else if(from == "fahrenheit"){
            switch(to){
            case "kelvin":
                result = Double(txtInputNum.text!)! - 32 * 5/9 + 273.15            case "celsius":
                result = Double(txtInputNum.text!)! - 32 * 5/9
            default:
                0
            }
        }
        
        if(String(result).count >= 5){
            lblResult.text = String(format: "%.5f", result)
            return Double(lblResult.text!)!
        }
        else{
            lblResult.text = String(result)
            return Double(lblResult.text!)!
        }
        
    }
    //convert button will call the get result fuction
    @IBAction func btnConvert(_ sender: UIButton) {
            getResult()
    }
    //Clear button will set all the values to nil
    @IBAction func clearBtnTapped(_ sender: UIButton) {
        from = ""
        to = ""
        number = ""
        result = 0
        fromValueLbl.text = ""
        toValueLbl.text = ""
        txtInputNum.text = ""
        lblResult.text = ""
    }
}
