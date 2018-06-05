//
//  LugarModel.swift
//  petfriendlyAround
//
//  Created by user139236 on 5/18/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
import MapKit
import Contacts
//Estructura para Ubicaciones Geograficas
/*struct UbicacionGeografica{
    let latitud: Double
    let longitud: Double
    
    init(_ latitud:Double,_ longitud:Double){
        self.latitud = latitud
        self.longitud = longitud
    }
}*/

//Clase del Modelo para la represetacion de los lugares del APP PetFriendlyAround
class LugarModel: NSObject, MKAnnotation{
    
    
    let identificador: String           //Identificador Unico Autogenerado como UUID o GUID
    let nombre: String                  //Nombre del lugar
    let descripcion: String             //Breve descripcion del lugar
    let categoria: CategoriaModel       //Categoria asociada al lugar
    let ubicacion: (Double,Double)      //UbicacionGeografica  //Ubicacion Geografica del lugar
    
    var coordinate: CLLocationCoordinate2D
    init(_ identificador:String,_ nombre:String,_ descripcion:String,_ categoria:CategoriaModel,_ ubicacion: (latitud:Double,longitud:Double)){
        //init(_ identificador:String,_ nombre:String,_ descripcion:String,_ categoria:CategoriaModel,_ ubicacion:UbicacionGeografica){
        self.identificador = identificador
        self.nombre = nombre
        self.descripcion = descripcion
        self.categoria = categoria
        self.ubicacion = ubicacion
        self.coordinate = CLLocationCoordinate2D(latitude: ubicacion.latitud, longitude: ubicacion.longitud)
        super.init()
    }
    
    var title: String? {
        return nombre
    }
    
    var subtitle: String? {
        return descripcion
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
