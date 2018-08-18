//
//  CountryCodeViewController.swift
//  emergencyCall
//
//  Created by Techsviewer on 6/3/18.
//  Copyright © 2018 Techsviewer. All rights reserved.
//

import UIKit
import CountryPickerView
import Firebase
import FirebaseAuth


class CountryCodeViewController: UIViewController {

     let cpv = CountryPickerView(frame: CGRect(x: 0, y: 0, width: 120, height: 20))
    @IBOutlet weak var contactNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        contactNumber.leftView = cpv
        contactNumber.leftViewMode = .always

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueMobileNumber(_ sender: Any) {
        
    
  
        let alert = UIAlertController(title: "Is your mobile number correct", message: "\(cpv.selectedCountry.phoneCode)\(contactNumber.text!)", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "edit", style: .cancel, handler: nil))

        
        
  
        alert.addAction(UIAlertAction(title: "edit", style: .cancel, handler: nil))
//        prepare(for: UIStoryboardSegue, sender: self?)
//        {
//            let dest = UIViewController.dest
//        }
        
        
        self.present(alert, animated: true)
        
        let action = UIAlertAction(title: "yes", style: .default) { (action) in
            
            PhoneAuthProvider.provider().verifyPhoneNumber("\(self.cpv.selectedCountry.phoneCode)\(self.contactNumber.text!)", uiDelegate: nil) { (verificationID, error) in
                if let error = error {
                    print(error)
                    return
                }
                // Sign in using the verificationID and the code sent to the user
                // ...
                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                self.performSegue(withIdentifier: "segue", sender: self)
            }
        }
        alert.addAction(action)
        
        
        
        
        self.performSegue(withIdentifier: "segue", sender: self)
        
        
        
        

        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var entermobileNumber = segue.destination as! VerifyMobileNumberViewController
        entermobileNumber.mystring = contactNumber.text!
    }
    
    
    

}
