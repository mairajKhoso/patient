//
//  mapViewController.swift
//  emergencyCall
//
//  Created by Techsviewer on 6/21/18.
//  Copyright © 2018 Techsviewer. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import MapKit
import Alamofire
import SwiftyJSON
class mapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    var mylocation: CLLocation?
    
    
    var time = 30
    var timer = Timer()

    @IBOutlet weak var CallDriverButton: RoundButton!
    @IBOutlet weak var emergencyButton: RoundButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var searchingLabel: UILabel!
    @IBOutlet weak var loadingIcon: UIImageView!
    @IBOutlet weak var custommapview: GMSMapView!
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var destinationLocation: CLLocation?
    //var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    let markerStart = GMSMarker()
    let markerEnd = GMSMarker()
    var lat = 24.860187
    var lng = 67.069943
    var location = "karachi"
    var latEnd = 24.863571
    var lngEnd = 67.075316
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatetime), userInfo: nil, repeats: true)
        

        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 9.0)
        custommapview.camera = camera
        
        markerStart.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        markerStart.title = location
        markerStart.snippet = location
        markerStart.map = custommapview
        
        markerEnd.position = CLLocationCoordinate2D(latitude: latEnd, longitude: lngEnd)
        markerEnd.title = location
        markerEnd.snippet = location
        //markerEnd.map = custommapview
        markerEnd.icon = self.imageWithImage(image: #imageLiteral(resourceName: "RedAmbulance"), scaledToSize:CGSize(width: 50.0, height: 50.0))
        
        let bounds = GMSCoordinateBounds(coordinate: markerStart.position, coordinate: markerEnd.position)
        let boundUpdate = GMSCameraUpdate.fit(bounds, withPadding: 40)
        custommapview.animate(with: boundUpdate)
        
        
        
        
    }
    
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func updatetime()
    {
        time -= 1
        if(time < 0)
        {
            uiView.isHidden = true
            cancelButton.isHidden = true
            emergencyButton.isHidden = true
            //custommapview.isHidden = true
            CallDriverButton.isHidden = false
            drawPath(currentLocation: markerStart.position, destinationLoc: markerEnd.position)

        }
    }



@IBAction func EmergencyCallButton(_ sender: Any) {
    loadingIcon.isHidden = false
    searchingLabel.isHidden = false
    uiView.isHidden = false
    cancelButton.isHidden = false
    emergencyButton.isHidden = true
    CallDriverButton.isHidden = true
    

    
//    drawPath(currentLocation: markerStart.position, destinationLoc: markerEnd.position)
}
    
    
    func drawPath(currentLocation:CLLocationCoordinate2D,destinationLoc:CLLocationCoordinate2D)
    {
        markerEnd.map = custommapview
            let origin = "\(currentLocation.latitude),\(currentLocation.longitude)"
            let destination = "\(destinationLoc.latitude),\(destinationLoc.longitude)"
        
        
            let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving"
        
            Alamofire.request(url).responseJSON { response in
            
                let json = try! JSON(data: response.data!)
                let routes = json["routes"].arrayValue
            
                for route in routes
                {
                    let routeOverviewPolyline = route["overview_polyline"].dictionary
                    let points = routeOverviewPolyline?["points"]?.stringValue
                    let path = GMSPath.init(fromEncodedPath: points!)
                    let polyline = GMSPolyline.init(path: path)
                    polyline.strokeColor = UIColor.black
                    polyline.strokeWidth = 10
                    polyline.map = self.custommapview
                }
        }
    }

}
