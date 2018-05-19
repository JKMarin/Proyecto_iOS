//
//  Usuario.swift
//  petfriendlyAround
//
//  Created by user139236 on 5/18/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
//Clase del Modelo para la represetacion de los usuarios del APP PetFriendlyAround

class UsuarioModel{
    let identificador: String       //Identificador Unico Autogenerado como UUID o GUID
    let correo: String              //Correo electronico del usuario
    let nombre: String              //Nombre del usuario
    let apellidos: String           //Apellidos del usuario
    let fechaNacimiento: Date       //Fecha de Nacimiento
    let genero: Character           //Genero Masculino Femenino
    let contrasenna: String         //Contrasenna del usuario
    
    init(_ identificador:String,_ correo:String,_ nombre:String,_ apellidos:String,_ fechaNacimiento:Date,_ genero:Character,_ contrasenna:String){
        self.identificador = identificador
        self.correo = correo
        self.nombre = nombre
        self.apellidos = apellidos
        self.fechaNacimiento = fechaNacimiento
        self.genero = genero
        self.contrasenna = contrasenna
    }
    
}
