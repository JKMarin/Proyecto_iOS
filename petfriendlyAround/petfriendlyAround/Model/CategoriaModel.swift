//
//  CategoriaModel.swift
//  petfriendlyAround
//
//  Created by user139236 on 5/18/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
import RealmSwift
//import Realm // Need to add import if you override default initializer!
//Clase del Modelo para la represetacion de las categorias del APP PetFriendlyAround

class CategoriaModel: Object{
    @objc dynamic var  identificador: Int = 0         //Identificador Unico
    @objc dynamic var  nombre: String  = ""             //Nombre de la categoria
    
    
    convenience init(_ identificador:Int,_ nombre:String){
        self.init()
        self.identificador = identificador
        self.nombre = nombre
        
    }
     
    override static func primaryKey() -> String? {
        return "identificador"
    }
}
