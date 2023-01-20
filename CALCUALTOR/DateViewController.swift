//
//  DateViewController.swift
//  CALCUALTOR
//
//  Created by Yakshi Gandhi
//

import UIKit

class DateViewController: UIViewController {

    //outlets
    @IBOutlet weak var txtBackground: UITextView!
    @IBOutlet weak var txtFromDate: UITextField!
    @IBOutlet weak var txtToDate: UITextField!
    @IBOutlet weak var fromDatePicker: UIDatePicker!
    @IBOutlet weak var toDatePicker: UIDatePicker!
    @IBOutlet weak var txtDifference: UITextField!
    
    
    // create object of DateFormatter and Calendar
    let dateFormatter = DateFormatter()
    let calendar = Calendar.current
    
    
    // function to get the difference between dates provided
    func getDifference() -> String {
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let fromDate = dateFormatter.date(from: txtFromDate.text!)
        let toDate = dateFormatter.date(from: txtToDate.text!)
        let dateDifference = calendar.dateComponents([.day], from: fromDate!, to: toDate!).day!
        
        let years = String(dateDifference / 365);
        let months = String((dateDifference % 365) / 30);
        let days = String((dateDifference % 365) % 30);

        txtDifference.text = "Years: \(years), Months: \(months), Days: \(days)"
        //txtDifference.text = String(dateDifference)
        
        
        return ("day:  \(txtDifference.text!)")
    }
    
    @IBAction func btnDifference(_ sender: UIButton) {
        getDifference()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // txtBackground.isUserInteractionEnabled = false

        // FROM
        // txtFromDate.isUserInteractionEnabled = false
        dateFormatter.dateFormat = "dd/MM/yyyy"
        txtFromDate.inputView = fromDatePicker
        fromDatePicker.datePickerMode = .date // defining the mode
        txtFromDate.text = dateFormatter.string(from: fromDatePicker.date)

        //To
        // txtToDate.isUserInteractionEnabled = false
        dateFormatter.dateFormat = "dd/MM/yyyy"
        txtToDate.inputView = toDatePicker
        toDatePicker.datePickerMode = .date // defining the mode
        txtToDate.text = dateFormatter.string(from: toDatePicker.date)
    }
    
    
    @IBAction func FromDatePickerValueChanged(_ sender: UIDatePicker) {
        //FROM
    txtFromDate.text = dateFormatter.string(from: sender.date)
        view.endEditing(true)
    }
    
    
    @IBAction func ToDatePickerValueChanged(_ sender: UIDatePicker) {
        //TO
        txtToDate.text = dateFormatter.string(from: sender.date)
            view.endEditing(true)
    }
    
}
