//
//  VerifyMobileNumberViewController.swift
//  emergencyCall
//
//  Created by Techsviewer on 6/3/18.
//  Copyright © 2018 Techsviewer. All rights reserved.
//

import UIKit
import FirebaseAuth

class VerifyMobileNumberViewController: UIViewController {

    var mystring = String()
   
    var time = 15
    var timer = Timer()
    
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield3: UITextField!
    @IBOutlet weak var textfield4: UITextField!
    @IBOutlet weak var textfield5: UITextField!
    @IBOutlet weak var textfield6: UITextField!
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberLabel.text = mystring
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatetime), userInfo: nil, repeats: true)
        
        
        textfield1.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        textfield2.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        textfield3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        textfield4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        textfield5.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        textfield6.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        
    }
 
    

    
    @objc func textFieldDidChange(textField: UITextField)
        {
            let text = textField.text
            if  text?.count == 1
            {
                switch textField
                {
                case textfield1:
                    textfield2.becomeFirstResponder()
                case textfield2:
                    textfield3.becomeFirstResponder()
                case textfield3:
                    textfield4.becomeFirstResponder()
                case textfield4:
                    textfield5.becomeFirstResponder()
                case textfield5:
                    textfield6.becomeFirstResponder()
                case textfield6:
                    textfield6.resignFirstResponder()
                    
                    let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")
                    let credential = PhoneAuthProvider.provider().credential(
                        withVerificationID: verificationID!,
                        verificationCode: "\(textfield1.text!)\(textfield2.text!)\(textfield3.text!)\(textfield4.text!)\(textfield5.text!)\(textfield6.text!)")
                    Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
                        if let error = error {
                            // ...
                            return
                        }
                        // User is signed in
                        // ...
                        self.performSegue(withIdentifier: "segue1", sender: self)

                    }
                    
                default:
                    break
                }
            }
        
        }
    
    @objc func updatetime()
    {
        time -= 1
        if(time<10)
        {
            update()
        }
        else
        {
        label1.text = "\(time)"
        label2.text = "\(time)"
        }
    }
    func update()
    {
        //var time = 9
        if(time >= 0)
        {
        label1.text = "0\(time)"
        label2.text = "0\(time)"
        }
        
        
    }

}







