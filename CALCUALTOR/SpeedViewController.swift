//
//  SpeedViewController.swift
//  CALCUALTOR
//
//  Created by Nishtha Patel 
//

import UIKit

class SpeedViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Outlets
    @IBOutlet weak var fromPickerView: UIPickerView!
    @IBOutlet weak var toPickerView: UIPickerView!
    @IBOutlet weak var fromValueLbl: UILabel!
    @IBOutlet weak var toValueLbl: UILabel!
    @IBOutlet weak var txtInputNum: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    //Local variables
    var arrayValues = Array<String>()
    
    override func viewDidLoad() {
        
        //populating an array on view load
        arrayValues = ["Metres/Hour", "KM/Hour", "Miles/Hour"]
//        fromValueLbl.text = "Metres/Hour"
//        toValueLbl.text = "Metres/Hour"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return arrayValues.count
        }
        else{
            return arrayValues.count
        }
    }
    
    //setting the lbl text based on picker view selected
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            fromValueLbl.text = arrayValues[row]
            return arrayValues[row] as? String
        }
        else if pickerView.tag == 1{
            toValueLbl.text = arrayValues[row]
            return arrayValues[row] as? String
        }
        return ""
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            self.fromValueLbl.text = self.arrayValues[row] as? String
        } else if pickerView.tag == 1 {
            self.toValueLbl.text = self.arrayValues[row] as? String
            }
        }
    
    //local variables
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
        if(fromValueLbl.text == toValueLbl.text){
            result = Double(txtInputNum.text!)!
            lblResult.text = String(result)
            return Double(lblResult.text!)!
        }
        else if(fromValueLbl.text == "Metres/Hour"){
            switch(toValueLbl.text){
            case "KM/Hour" :
                result = Double(txtInputNum.text!)! / 1000
            case "Miles/Hour" :
                result = Double(txtInputNum.text!)! / 1609
            default: 0
            }
        }
        else if(fromValueLbl.text == "KM/Hour"){
            switch(toValueLbl.text){
            case "Metres/Hour" :
                result = Double(txtInputNum.text!)! * 1000
            case "Miles/Hour" :
                result = Double(txtInputNum.text!)! / 1.609
            default: 0
            }
        }
        else if(fromValueLbl.text == "Miles/Hour"){
            switch(toValueLbl.text){
            case "Metres/Hour" :
                result = Double(txtInputNum.text!)! * 1609
            case "KM/Hour" :
                result = Double(txtInputNum.text!)! * 1.609
            default: 0
            }
        }
        
        lblResult.text = String(format: "%.3f", result)
        return Double(lblResult.text!)!
    }
    //convert button will call the get result fuction
    @IBAction func btnConvert(_ sender: UIButton) {
            getResult()
    }
    //Clear button will set all the values to nil
    @IBAction func clearBtnTapped(_ sender: UIButton) {
        number = ""
        result = 0
        txtInputNum.text = ""
        lblResult.text = ""
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
