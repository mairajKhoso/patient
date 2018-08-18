//
//  profileViewController.swift
//  emergencyCall
//
//  Created by Techsviewer on 7/11/18.
//  Copyright © 2018 Techsviewer. All rights reserved.
//

import UIKit
import Firebase

class profileViewController: UIViewController {

    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var DOB: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var gender: UILabel!
    
    
    // signed in user details (current user)
    var userID = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        //retreiving data from firebase
        
        ref.child("users").child(userID!).observe(.value) { (snap) in
            
            guard let obj = snap.value as? [String:Any] else {return}
            guard let fName = obj["firstName"] as? String else {return}
            guard let lName = obj["lastName"] as? String else {return}
            guard let email = obj["email"] as? String else {return}
            guard let dateOB = obj["DOB"] as? String else {return}
            guard let gendr = obj["isMale"] as? Bool else {return}
            
            self.firstName.text = fName
            self.lastName.text = lName
            self.email.text = email
            self.DOB.text = dateOB
            if gendr == true
            {
                self.gender.text = "male"
            }
            else
            {
                self.gender.text = "female"
            }
            
            
            
            
            print(snap.value)
        }
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func homeButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
