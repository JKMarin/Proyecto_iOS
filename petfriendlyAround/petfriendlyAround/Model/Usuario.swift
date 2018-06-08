//
//  Usuario.swift
//  petfriendlyAround
//
//  Created by user139236 on 5/18/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
import RealmSwift
//Clase del Modelo para la represetacion de los usuarios del APP PetFriendlyAround

class UsuarioModel: Object{
    @objc dynamic var identificador: String = ""       //Identificador Unico Autogenerado como UUID o GUID
    @objc dynamic var correo: String = ""              //Correo electronico del usuario
    @objc dynamic var nombre: String = ""              //Nombre del usuario
    @objc dynamic var apellidos: String = ""           //Apellidos del usuario
    @objc dynamic var fechaNacimiento: Date = Date()      //Fecha de Nacimiento
    @objc dynamic var contrasenna: String = ""         //Contrasenna del usuario
    let favoritos: List<LugarModel> = List<LugarModel>()
    
    convenience init(_ identificador:String,_ correo:String,_ nombre:String,_ apellidos:String,_ fechaNacimiento:Date,_ contrasenna:String){
        self.init()
        self.identificador = identificador
        self.correo = correo
        self.nombre = nombre
        self.apellidos = apellidos
        self.fechaNacimiento = fechaNacimiento
        self.contrasenna = contrasenna
    }
    
}
