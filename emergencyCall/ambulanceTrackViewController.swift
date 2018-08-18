//
//  ambulanceTrackViewController.swift
//  emergencyCall
//
//  Created by Techsviewer on 6/26/18.
//  Copyright © 2018 Techsviewer. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class ambulanceTrackViewController: UIViewController {

    @IBOutlet weak var CMapView: GMSMapView!
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 24.860187, longitude: 67.069943, zoom: 15)
        CMapView.camera = camera
        
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 24.860187, longitude: 67.069943)
        //        marker.title = "Sydney"
        //        marker.snippet = "Australia"
        marker.map = CMapView
        CMapView.isMyLocationEnabled = true
        
        

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
