//
//  listViewController.swift
//  CALCUALTOR
//
//  Created by Raj Rami
//

import UIKit

class listViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    // define an array of values ..which you want to be displayed
    let list = ["Standard Calculator", "Length", "Weight", "Date Calculations", "Temperature", "Time", "Speed"]
   
    // outlets
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // returns how many rows in the table
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return list.count
    } // end func tableview
     
    // returns the cell
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {

        let tempCell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        tempCell.labelList.text = list[indexPath.row]
        
         return tempCell
     } // end func tableView

    // Display the view controllerbased on row selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(list[indexPath.row] == "Standard Calculator"){
            let detailstdVC:StdViewController = self.storyboard?.instantiateViewController(withIdentifier: "StdViewController") as! StdViewController
            self.navigationController?.pushViewController(detailstdVC, animated: true)
        }
        else if(list[indexPath.row] == "Length"){
            let detailLenVC:lengthViewController = self.storyboard?.instantiateViewController(withIdentifier: "lengthViewController") as! lengthViewController
            self.navigationController?.pushViewController(detailLenVC, animated: true)
        }
        else if(list[indexPath.row] == "Weight"){
            let detailWeiVC:WeightViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeightViewController") as! WeightViewController
            self.navigationController?.pushViewController(detailWeiVC, animated: true)
        }
        else if(list[indexPath.row] == "Date Calculations"){
            let detailDateVC:DateViewController = self.storyboard?.instantiateViewController(withIdentifier: "DateViewController") as! DateViewController
            self.navigationController?.pushViewController(detailDateVC, animated: true)
        }
        else if(list[indexPath.row] == "Temperature"){
            let detailVC:TempViewController = self.storyboard?.instantiateViewController(withIdentifier: "TempViewController") as! TempViewController
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        else if(list[indexPath.row] == "Time"){
            let detailTimeVC:TimeViewController = self.storyboard?.instantiateViewController(withIdentifier: "TimeViewController") as! TimeViewController
            self.navigationController?.pushViewController(detailTimeVC, animated: true)
        }
        else if(list[indexPath.row] == "Speed"){
            let detailSpeVC:SpeedViewController = self.storyboard?.instantiateViewController(withIdentifier: "SpeedViewController") as! SpeedViewController
            self.navigationController?.pushViewController(detailSpeVC, animated: true)
        }
    }
 } // end class
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
