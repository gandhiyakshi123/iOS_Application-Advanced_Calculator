//
//  WeightViewController.swift
//  CALCUALTOR
//
//   Created by Yakshi Gandhi
//

import UIKit

class WeightViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var selectFromBtn: UIButton!
    @IBOutlet var fromBtnCollection: [UIButton]!
    
    @IBOutlet weak var selectToBtn: UIButton!
    @IBOutlet var toBtnCollection: [UIButton]!
    
    @IBOutlet weak var fromValueLbl: UILabel!
    @IBOutlet weak var toValueLbl: UILabel!
    @IBOutlet weak var txtInputNum: UITextField!
    @IBOutlet weak var lblResult: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        selectFromBtn.layer.cornerRadius = selectFromBtn.frame.height/2
        fromBtnCollection.forEach { (btn) in
            btn.layer.cornerRadius = btn.frame.height/2
            btn.isHidden = true
            btn.alpha = 0
        }
        
        selectToBtn.layer.cornerRadius = selectToBtn.frame.height/2
        toBtnCollection.forEach { (btn) in
            btn.layer.cornerRadius = btn.frame.height/2
            btn.isHidden = true
            btn.alpha = 0
        }
    }
    
    //from dropdown
    @IBAction func selectFromPressed(_ sender: UIButton) {
        fromBtnCollection.forEach { (btn) in
            UIView.animate(withDuration: 0.7) {
                btn.isHidden = !btn.isHidden
                btn.alpha = btn.alpha == 0 ? 1 :0
                btn.layoutIfNeeded()
            }
        }
    }
    
    // to dropdown
    @IBAction func selectToPressed(_ sender: UIButton) {
        toBtnCollection.forEach { (btn) in
            UIView.animate(withDuration: 0.7) {
                btn.isHidden = !btn.isHidden
                btn.alpha = btn.alpha == 0 ? 1 :0
                btn.layoutIfNeeded()
            }
        }
    }
    
    //get selected value from "FROM dropdown"
    @IBAction func fromPressed(_ sender: UIButton) {
        if let lblFrom = sender.titleLabel?.text{
            fromValueLbl.text = lblFrom
        }
    }
    
    //get selected value from "To dropdown"
    @IBAction func toPressed(_ sender: UIButton) {
        if let lblTo = sender.titleLabel?.text{
            toValueLbl.text = lblTo
        }
    }

    
    //custom variables
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
    
    //Clear button will set all the values to nil
    @IBAction func clearBtnTapped(_ sender: UIButton) {
        fromValueLbl.text = ""
        toValueLbl.text = ""
        number = ""
        result = 0
        fromValueLbl.text = ""
        toValueLbl.text = ""
        txtInputNum.text = ""
        lblResult.text = ""
    }
    
    
    //Getting result based on different selected units
    func getResult() -> Double {
        if(Double(txtInputNum.text!) == nil){
            txtInputNum.text = "0"
        }
        if(fromValueLbl.text != "" && toValueLbl.text != "" && fromValueLbl.text == toValueLbl.text){
            result = Double(txtInputNum.text!)!
            lblResult.text = String(result)
            return Double(lblResult.text!)!
        }
        else if(fromValueLbl.text == "carat"){
            switch(toValueLbl.text){
            case "milligram":
                result = Double(txtInputNum.text!)! * 200
            case "centigram":
                result = Double(txtInputNum.text!)! * 20
            case "gram":
                result = Double(txtInputNum.text!)! / 5
            case "kilogram":
                result = Double(txtInputNum.text!)! / 5000
            case "ounce":
                result = Double(txtInputNum.text!)! / 141.7
            case "pound":
                result = Double(txtInputNum.text!)! / 2268
            default:
                0
            }
        }
        else if(fromValueLbl.text == "milligram"){
            switch(toValueLbl.text){
            case "carat":
                result = Double(txtInputNum.text!)! / 200
            case "centigram":
                result = Double(txtInputNum.text!)! / 10
            case "gram":
                result = Double(txtInputNum.text!)! / 1000
            case "kilogram":
                result = Double(txtInputNum.text!)! / 1000000
            case "ounce":
                result = Double(txtInputNum.text!)! / 28350
            case "pound":
                result = Double(txtInputNum.text!)! / 453600
            default:
                0
            }
        }
        else if(fromValueLbl.text == "centigram"){
            switch(toValueLbl.text){
            case "milligram":
                result = Double(txtInputNum.text!)! * 10
            case "carat":
                result = Double(txtInputNum.text!)! / 20
            case "gram":
                result = Double(txtInputNum.text!)! / 100
            case "kilogram":
                result = Double(txtInputNum.text!)! / 100000
            case "ounce":
                result = Double(txtInputNum.text!)! / 2835
            case "pound":
                result = Double(txtInputNum.text!)! / 45360
            default:
                0
            }
        }
        else if(fromValueLbl.text == "gram"){
            switch(toValueLbl.text){
            case "milligram":
                result = Double(txtInputNum.text!)! * 1000
            case "centigram":
                result = Double(txtInputNum.text!)! * 100
            case "carat":
                result = Double(txtInputNum.text!)! * 5
            case "kilogram":
                result = Double(txtInputNum.text!)! / 1000
            case "ounce":
                result = Double(txtInputNum.text!)! / 28.35
            case "pound":
                result = Double(txtInputNum.text!)! / 453.6
            default:
                0
            }
        }
        else if(fromValueLbl.text == "kilogram"){
            switch(toValueLbl.text){
            case "milligram":
                result = Double(txtInputNum.text!)! * 1000000
            case "centigram":
                result = Double(txtInputNum.text!)! * 100000
            case "gram":
                result = Double(txtInputNum.text!)! * 1000
            case "carat":
                result = Double(txtInputNum.text!)! * 5000
            case "ounce":
                result = Double(txtInputNum.text!)! * 35.274
            case "pound":
                result = Double(txtInputNum.text!)! * 2.20462
            default:
                0
            }
        }
        else if(fromValueLbl.text == "ounce"){
            switch(toValueLbl.text){
            case "milligram":
                result = Double(txtInputNum.text!)! * 28350
            case "centigram":
                result = Double(txtInputNum.text!)! * 2835
            case "gram":
                result = Double(txtInputNum.text!)! * 28.35
            case "kilogram":
                result = Double(txtInputNum.text!)! / 35.274
            case "carat":
                result = Double(txtInputNum.text!)! * 141.7
            case "pound":
                result = Double(txtInputNum.text!)! / 16
            default:
                0
            }
        }
        else if(fromValueLbl.text == "pound"){
            switch(toValueLbl.text){
            case "milligram":
                result = Double(txtInputNum.text!)! * 453600
            case "centigram":
                result = Double(txtInputNum.text!)! * 45360
            case "gram":
                result = Double(txtInputNum.text!)! * 453.6
            case "kilogram":
                result = Double(txtInputNum.text!)! / 2.205
            case "ounce":
                result = Double(txtInputNum.text!)! * 16
            case "carat":
                result = Double(txtInputNum.text!)! * 2268
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
    

}
