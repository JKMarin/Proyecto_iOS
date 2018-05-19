//
//  LugarModel.swift
//  petfriendlyAround
//
//  Created by user139236 on 5/18/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
//Estructura para Ubicaciones Geograficas
struct UbicacionGeografica{
    let latitud: Double
    let longitud: Double
    
    init(_ latitud:Double,_ longitud:Double){
        self.latitud = latitud
        self.longitud = longitud
    }
}

//Clase del Modelo para la represetacion de los lugares del APP PetFriendlyAround
class LugarModel{
    let identificador: String           //Identificador Unico Autogenerado como UUID o GUID
    let nombre: String                  //Nombre del lugar
    let descripcion: String             //Breve descripcion del lugar
    let categoria: CategoriaModel       //Categoria asociada al lugar
    let ubicacion: UbicacionGeografica  //Ubicacion Geografica del lugar
    
    init(_ identificador:String,_ nombre:String,_ descripcion:String,_ categoria:CategoriaModel,_ ubicacion:UbicacionGeografica){
        self.identificador = identificador
        self.nombre = nombre
        self.descripcion = descripcion
        self.categoria = categoria
        self.ubicacion = ubicacion
    }
}
