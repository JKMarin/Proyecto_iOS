//
//  CategoriaModel.swift
//  petfriendlyAround
//
//  Created by user139236 on 5/18/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
//Clase del Modelo para la represetacion de las categorias del APP PetFriendlyAround

class CategoriaModel{
    let identificador: String       //Identificador Unico Autogenerado como UUID o GUID
    let nombre: String              //Nombre de la categoria
    
    
    init(_ identificador:String,_ nombre:String){
        self.identificador = identificador
        self.nombre = nombre
    }
    
}
