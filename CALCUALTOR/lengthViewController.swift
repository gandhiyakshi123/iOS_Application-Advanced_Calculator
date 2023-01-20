//
//  lengthViewController.swift
//  CALCUALTOR
//
//  Created by Yakshi Gandhi
//

import UIKit

class lengthViewController: UIViewController {
    
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
    @IBAction func fromBtnM(_ sender: UIButton) {
        from = "m"
        fromValueLbl.text = from
    }
    @IBAction func fromBtnCM(_ sender: UIButton) {
        from = "cm"
        fromValueLbl.text = from
    }
    @IBAction func fromBtnMM(_ sender: UIButton) {
        from = "mm"
        fromValueLbl.text = from
    }
    @IBAction func fromBtnKM(_ sender: UIButton) {
        from = "km"
        fromValueLbl.text = from
    }
    @IBAction func fromBtnFEET(_ sender: UIButton) {
        from = "feet"
        fromValueLbl.text = from
    }
    @IBAction func fromBtnINCH(_ sender: UIButton) {
        from = "inch"
        fromValueLbl.text = from
    }
    
    
    //Actions for TO buttons
    @IBAction func toBtnM(_ sender: UIButton) {
        to = "m"
        toValueLbl.text = to
    }
    @IBAction func toBtnCM(_ sender: UIButton) {
        to = "cm"
        toValueLbl.text = to
    }
    @IBAction func toBtnMM(_ sender: UIButton) {
        to = "mm"
        toValueLbl.text = to
    }
    @IBAction func toBtnKM(_ sender: UIButton) {
        to = "km"
        toValueLbl.text = to
    }
    @IBAction func toBtnFEET(_ sender: UIButton) {
        to = "feet"
        toValueLbl.text = to
    }
    @IBAction func toBtnINCH(_ sender: UIButton) {
        to = "inch"
        toValueLbl.text = to
    }
    
    var number: String = ""
    var result:Double = 0
    
    //Get the number from the user
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
        else if(from == "m"){
            switch(to){
            case "cm":
                result = Double(txtInputNum.text!)! * 100
            case "mm":
                result = Double(txtInputNum.text!)! * 1000
            case "km":
                result = Double(txtInputNum.text!)! / 1000
            case "feet":
                result = Double(txtInputNum.text!)! * 3.28084
            case "inch":
                result = Double(txtInputNum.text!)! * 39.3701
            default:
                0
            }
        }
        else if(from == "cm"){
            switch(to){
            case "m":
                result = Double(txtInputNum.text!)! / 100
            case "mm":
                result = Double(txtInputNum.text!)! * 10
            case "km":
                result = Double(txtInputNum.text!)! / 100000
            case "feet":
                result = Double(txtInputNum.text!)! * 0.0328084
            case "inch":
                result = Double(txtInputNum.text!)! * 0.393701
            default:
                0
            }
        }
        else if(from == "mm"){
            switch(to){
            case "m":
                result = Double(txtInputNum.text!)! / 1000
            case "cm":
                result = Double(txtInputNum.text!)! / 10
            case "km":
                result = Double(txtInputNum.text!)! / 1000000
            case "feet":
                result = Double(txtInputNum.text!)! / 305
            case "inch":
                result = Double(txtInputNum.text!)! * 0.0393701
            default:
                0
            }
        }
        else if(from == "km"){
            switch(to){
            case "m":
                result = Double(txtInputNum.text!)! * 1000
            case "cm":
                result = Double(txtInputNum.text!)! * 100000
            case "mm":
                result = Double(txtInputNum.text!)! * 1000000
            case "feet":
                result = Double(txtInputNum.text!)! * 3280.84
            case "inch":
                result = Double(txtInputNum.text!)! * 39370.1
            default:
                0
            }
        }
        else if(from == "feet"){
            switch(to){
            case "m":
                result = Double(txtInputNum.text!)! * 0.304
            case "cm":
                result = Double(txtInputNum.text!)! * 30.48
            case "mm":
                result = Double(txtInputNum.text!)! * 304.8
            case "km":
                result = Double(txtInputNum.text!)! * 0.0003048
            case "inch":
                result = Double(txtInputNum.text!)! * 12
            default:
                0
            }
        }
        else if(from == "inch"){
            switch(to){
            case "m":
                result = Double(txtInputNum.text!)! * 0.0254
            case "cm":
                result = Double(txtInputNum.text!)! * 2.54
            case "mm":
                result = Double(txtInputNum.text!)! * 25.4
            case "km":
                result = Double(txtInputNum.text!)! / 39370.0787
            case "feet":
                result = Double(txtInputNum.text!)! / 12
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
