//
//  FavoritoModel.swift
//  petfriendlyAround
//
//  Created by user139236 on 5/18/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
//Clase del Modelo para la represetacion de los favoritos del APP PetFriendlyAround
class FavoritoModel{
    let identificacionUsuario: String           //Identificador del usuario asociado al favoritp
    let identificacionLugar: String             //Identificador del lugar favorito
    
    init(_ usuario:String,_ lugar:String){
        self.identificacionUsuario = usuario
        self.identificacionLugar = lugar
    }
}
