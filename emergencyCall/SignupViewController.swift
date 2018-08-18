//
//  SignupViewController.swift
//  emergencyCall
//
//  Created by Techsviewer on 6/6/18.
//  Copyright © 2018 Techsviewer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import BEMCheckBox


class SignupViewController: UIViewController {
    
    var ismale:Bool?
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var femaleView: BEMCheckBox!
    @IBOutlet weak var maleView: BEMCheckBox!
    @IBOutlet weak var male: UIButton!
    @IBOutlet weak var female: UIButton!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var DOB: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
        
        
        //date picker view for DOB
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signupButton(_ sender: Any) {
        
        let userID = Auth.auth().currentUser?.uid
       // self.ref.child("users").child(user.uid).setValue(["username": username])
        self.ref.child("users").child((userID)!).setValue(["firstName":self.firstName.text!, "lastName":self.lastName.text!,"email":self.email.text!, "isMale":ismale,"DOB":DOB.calendar])
        
        self.performSegue(withIdentifier: "MapViewSegue", sender: self)
        
    }
    
    @IBAction func femaleButton(_ sender: Any) {
        femaleView.on = true
        ismale = false
        if femaleView.on == true{
            maleView.on = false
        }
        
        
    }
    
    @IBAction func maleButton(_ sender: Any) {
        maleView.on = true
        ismale = true
        if maleView.on == true {
            femaleView.on  = false
        }

    
    
}
    
    
}
