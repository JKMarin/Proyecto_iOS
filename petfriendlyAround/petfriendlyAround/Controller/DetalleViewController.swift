//
//  DetalleViewController.swift
//  petfriendlyAround
//
//  Created by user139236 on 6/8/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import UIKit
import MapKit
class DetalleViewController: UITableViewController {
    let regionRadius: CLLocationDistance = 500
    //let store = StoreManager.sharedInstance
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var descripcion: UILabel!
    @IBOutlet weak var categoria: UILabel!
    
    var anotacion: Anotacion?{
        didSet{
            refreshUI()
        }
    }
    func refreshUI(){
        //loadViewIfNeeded()
    }
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let initialLocation = CLLocation(latitude: anotacion!.coordinate.latitude, longitude: anotacion!.coordinate.longitude)
        centerMapOnLocation(location: initialLocation)
        mapView.delegate = self
        
        self.mapView.addAnnotation(anotacion!)
        self.nombre.text = anotacion?.title
        self.descripcion.text = anotacion?.subtitle
        self.categoria.text = anotacion?.categoria
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
extension DetalleViewController: MKMapViewDelegate {
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? Anotacion else { return nil }
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
            //view.canShowCallout = true
            //view.calloutOffset = CGPoint(x: -5, y: 5)
            //view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    /*func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Anotacion
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }*/
}
