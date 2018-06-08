//
//  LugarModel.swift
//  petfriendlyAround
//
//  Created by user139236 on 5/18/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
import RealmSwift
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
class LugarModel: Object{
    @objc dynamic var identificador: String = ""         //Identificador Unico Autogenerado como UUID o GUID
    @objc dynamic var nombre: String = ""                   //Nombre del lugar
    @objc dynamic var descripcion: String = ""              //Breve descripcion del lugar
    @objc dynamic var categoria: CategoriaModel?       //Categoria asociada al lugar
    @objc dynamic var latitud:Double = 0
    @objc dynamic var longitud:Double = 0   //UbicacionGeografica  //Ubicacion Geografica del lugar
    
  
    convenience init(_ identificador:String,_ nombre:String,_ descripcion:String,_ categoria:CategoriaModel,_ ubicacion: (latitud:Double,longitud:Double)){
        self.init()
        self.identificador = identificador
        self.nombre = nombre
        self.descripcion = descripcion
        self.categoria = categoria
        self.latitud = ubicacion.latitud
        self.longitud = ubicacion.longitud
       
    }
    override static func primaryKey() -> String? {
        return "identificador"
    }
   
}
