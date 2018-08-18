//
//  googlemapViewController.swift
//  emergencyCall
//
//  Created by Techsviewer on 7/8/18.
//  Copyright © 2018 Techsviewer. All rights reserved.
//

import UIKit
import MapKit

class googlemapViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mpkitview: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mpkitview.delegate = self
        mpkitview.showsScale = true
        mpkitview.showsPointsOfInterest = true
        mpkitview.showsUserLocation = true
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
