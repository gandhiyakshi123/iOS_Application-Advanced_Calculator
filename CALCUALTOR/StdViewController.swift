//
//  StdViewController.swift
//  CALCUALTOR
//
//  Created by Raj Rami
//

import UIKit

class StdViewController: UIViewController {
    
    //Outlets and collections
    @IBOutlet weak var txtFirstNum: UITextField!
    @IBOutlet weak var txtSecondNum: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblOperation: UILabel!
    
    //Local variables
    var firstNum: String = ""
    var secondNum: String = ""
    var operation: String = ""
    var result: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Setting operations based on operation pressed
    @IBAction func add(_ sender: UIButton) {
        operation = "+"
        lblOperation.text = operation
    }
    @IBAction func subtract(_ sender: UIButton) {
        operation = "-"
        lblOperation.text = operation
    }
    @IBAction func multiplication(_ sender: UIButton) {
        operation = "x"
        lblOperation.text = operation
    }
    @IBAction func divide(_ sender: UIButton) {
        operation = "÷"
        lblOperation.text = operation
    }
    @IBAction func square(_ sender: UIButton) {
        operation = "x²"
        lblOperation.text = operation
        if(Double(txtFirstNum.text!) == nil){
            txtFirstNum.text = "0"
        }
        txtSecondNum.text = ""
        result = Double(txtFirstNum.text!)! * Double(txtFirstNum.text!)!
        if(String(result).count >= 3){
            lblResult.text = String(format: "%.3f", result)
        }
        else{
            lblResult.text = String(result)
        }
    }
    @IBAction func percentage(_ sender: UIButton) {
        operation = "%"
        lblOperation.text = operation
        if(Double(txtFirstNum.text!) == nil){
            txtFirstNum.text = "0"
        }
        txtSecondNum.text = ""
        result = Double(txtFirstNum.text!)! / 100
        if(String(result).count >= 3){
            lblResult.text = String(format: "%.3f", result)
        }
        else{
            lblResult.text = String(result)
        }
    }
    @IBAction func squareRoot(_ sender: UIButton) {
        operation = "√"
        lblOperation.text = operation
        if(Double(txtFirstNum.text!) == nil){
            txtFirstNum.text = "0"
        }
        txtSecondNum.text = ""
        result = sqrt(Double(txtFirstNum.text!)!)
        if(String(result).count >= 3){
            lblResult.text = String(format: "%.3f", result)
        }
        else{
            lblResult.text = String(result)
        }
    }
    
    //Get the number from the user
    @IBAction func numberPressed(_ sender: UIButton) {
        if(operation == ""){
            firstNum += String(sender.tag)
            txtFirstNum.text = firstNum
        }
        else if(operation != "" && operation != "x²" && operation != "%" && operation != "√"){
            secondNum += String(sender.tag)
            txtSecondNum.text = secondNum
        }
    }
    
    //get the dot btn on text field
    @IBAction func dotBtnPressed(_ sender: UIButton) {
        
        if (txtFirstNum.text!.count == 0 && operation == ""){
            firstNum = "0."
            txtFirstNum.text = firstNum
        }
        else{
            if (txtFirstNum.text!.range(of: ".") == nil && operation == ""){
                firstNum = txtFirstNum.text! + "."
                txtFirstNum.text = firstNum
            }
        }
        
        if (txtSecondNum.text!.count == 0 && operation != "" && operation != "x²" && operation != "%" && operation != "√"){
            secondNum = "0."
            txtSecondNum.text = secondNum
        }
        else{
            if (txtSecondNum.text!.range(of: ".") == nil && operation != "" && operation != "x²" && operation != "%" && operation != "√"){
                secondNum = txtSecondNum.text! + "."
                txtSecondNum.text = secondNum
            }
        }
    }
    
    //Function to get the result by performing operation
    func getResult() -> Double {
        if(Double(txtFirstNum.text!) == nil){
            txtFirstNum.text = "0"
        }
        if(Double(txtSecondNum.text!) == nil){
            txtSecondNum.text = "0"
        }
        if(lblOperation.text == "x²" || lblOperation.text == "%" || lblOperation.text == "√"){
            txtSecondNum.text = ""
        }

        switch(operation){
        case "+" :
            result = Double(txtFirstNum.text!)! + Double(txtSecondNum.text!)!
        case "-" :
            result = Double(txtFirstNum.text!)! - Double(txtSecondNum.text!)!
        case "x" :
            result = Double(txtFirstNum.text!)! * Double(txtSecondNum.text!)!
        case "÷" :
            result = Double(txtFirstNum.text!)! / Double(txtSecondNum.text!)!
        default:
            0
        }
        
        if(String(result).count >= 5){
            lblResult.text = String(format: "%.5f", result)
        }
        else{
            lblResult.text = String(result)
        }
        return Double(lblResult.text!)!
    }
    
    //EqualPreesed call the getResult function to get the result
    @IBAction func equalPressed(_ sender: UIButton) {
        getResult()
    }
    
    //Clear button will set all the values to nil
    @IBAction func clearTapped(_ sender: UIButton) {
        firstNum = ""
        secondNum = ""
        operation = ""
        result = 0.0
        
        txtFirstNum.text = firstNum
        txtSecondNum.text = secondNum
        lblOperation.text = operation
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
