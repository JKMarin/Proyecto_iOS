//
//  Anotacion.swift
//  petfriendlyAround
//
//  Created by user139236 on 6/8/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Anotacion: NSObject, MKAnnotation {
    let title:String?
    let subtitle:String?
    let categoria:String?
    let coordinate: CLLocationCoordinate2D
    init(_ lugar:LugarModel,_ categoria:String){
        self.title = lugar.nombre
        self.subtitle = lugar.descripcion
        self.coordinate = CLLocationCoordinate2D(latitude: lugar.latitud, longitude: lugar.longitud)
        self.categoria = categoria
        super.init()
    }
    
    
    // Annotation right callout accessory opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
