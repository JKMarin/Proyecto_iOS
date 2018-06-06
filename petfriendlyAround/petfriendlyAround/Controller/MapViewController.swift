//
//  MapViewController.swift
//  petfriendlyAround
//
//  Created by user139236 on 6/4/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//
import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    let store = StoreManager.sharedInstance
   
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    // called when the value of SegmentedControl is changed.
    @IBAction  func mapViewChanged(segcon: UISegmentedControl){
        segcon.
        switch segcon.selectedSegmentIndex {
        case 0:
           // mySegLabel.backgroundColor = UIColor.redColor()
            print("myRightSideBarButtonItemTapped")
        case 1:
           // mySegLabel.backgroundColor = UIColor.blueColor()
            
      print("myRightSideBarButtonItemTapped")
            
        default:
            print("Error")
        }
        //self.alert.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!)
    {
        print("myRightSideBarButtonItemTapped")
        let alertController = UIAlertController(title: nil, message: "Selecione la Vista", preferredStyle: .actionSheet)
        
        let alertAction1 = UIAlertAction(title: "One", style: UIAlertActionStyle.default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel){ action in
            // ...
        }
        
        let myArray: NSArray = ["Red","Blue","Green"]
        
         //make SegmentedControl
        let mySegcon: UISegmentedControl = UISegmentedControl(items: myArray as [AnyObject])
       // mySegcon.center = CGPoint(x: self.view.frame.width/2, y: 400)
        mySegcon.backgroundColor = UIColor.gray
        mySegcon.tintColor = UIColor.white
        // add an event for valueChanged.
        mySegcon.addTarget(self, action: #selector(mapViewChanged), for: UIControlEvents.valueChanged)
        mySegcon.addTarget(self, for: UIControlEvents.valueChanged){action in
            
        }
        
        alertController.view.addSubview(mySegcon)
        //let switchAlert = SwitchAlertActionViewController()
        //switchAlert.isSwitchOn = true
        //alertAction1.setValue(SegmentedAlertActionViewController(), forKey: "contentViewController")
        
        alertController.addAction(alertAction1)
        alertController.addAction(cancelAction)
        
        //let popPresenter = alertController.popoverPresentationController
        //popPresenter?.sourceView = self.view
        //popPresenter?.barButtonItem = self.navigationItem.rightBarButtonItem
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.s
        let rightBarButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.myRightSideBarButtonItemTapped(_:)))
        rightBarButton.image = UIImage(named: "switchList")
        //self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.rightBarButtonItems = [rightBarButton]
        
        // set initial location 9.9351658,-84.0656517
        let initialLocation = CLLocation(latitude: 9.9366, longitude: -84.0660)
        centerMapOnLocation(location: initialLocation)
        mapView.delegate = self
        
        var lugares =  store.getLugares(porCategoria: 0)
        
        
        self.mapView.addAnnotations(lugares.lista)
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension MapViewController: MKMapViewDelegate {
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? LugarModel else { return nil }
        // 3
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! LugarModel
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
}
