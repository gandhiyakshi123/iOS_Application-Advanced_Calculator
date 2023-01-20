//
//  LoginViewController.swift
//  CALCUALTOR
//
//  Created by Raj Rami
//

import UIKit

class LoginViewController: UIViewController {

    //outlets
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //hide the error button
        self.errorLbl.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    // login button will check the credentials if they are correct or not, it will either show error or it will redirect to the list view
    @IBAction func btnLogin(_ sender: UIButton) {
        
        if(txtUsername.text == "georgiancollege" && txtPassword.text == "062029"){
            let detailVC:listViewController = self.storyboard?.instantiateViewController(withIdentifier: "listViewController") as! listViewController
            self.navigationController?.pushViewController(detailVC, animated: true)
            errorLbl.isHidden = true
        }
        else{
            errorLbl.isHidden = false
            errorLbl.text = "Error: Username or password is incorrect"
        }
        
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
