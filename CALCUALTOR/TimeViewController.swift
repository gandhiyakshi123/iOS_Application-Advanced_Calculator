//
//  TimeViewController.swift
//  CALCUALTOR
//
//  Created by Nishtha Patel 
//

import UIKit

class TimeViewController: UIViewController {

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
    
    //to dropdown
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
        else if(fromValueLbl.text == "Hour"){
            switch(toValueLbl.text){
            case "Minute":
                result = Double(txtInputNum.text!)! * 60
            case "Second":
                result = Double(txtInputNum.text!)! * 3600
            default:
                0
            }
        }
        else if(fromValueLbl.text == "Minute"){
            switch(toValueLbl.text){
            case "Hour":
                result = Double(txtInputNum.text!)! / 60
            case "Second":
                result = Double(txtInputNum.text!)! * 60
            default:
                0
            }
        }
        else if(fromValueLbl.text == "Second"){
            switch(toValueLbl.text){
            case "Hour":
                result = Double(txtInputNum.text!)! / 3600
            case "Minute":
                result = Double(txtInputNum.text!)! / 60
            default:
                0
            }
        }
        
        if(String(result).count >= 2){
            lblResult.text = String(format: "%.2f", result)
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
