//
//  SindMenuViewController.swift
//  emergencyCall
//
//  Created by Techsviewer on 7/4/18.
//  Copyright © 2018 Techsviewer. All rights reserved.
//

import UIKit
import FirebaseAuth

class SideMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Signout(_ sender: Any) {
       
        try! Auth.auth().signOut()
        //self.performSegue(withIdentifier: "signoutsegue", sender: self)
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "firstVC") as! ViewController
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func profile(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "profilestory") as! profileViewController
        self.present(controller, animated: true, completion: nil)
        
        
        
    }
    

}
