//
//  StoreMockUp.swift
//  petfriendlyAround
//
//  Created by user139236 on 6/3/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
class StoreMockUp{
   static func listarCategorias() -> ListaModel<CategoriaModel>{
        let categorias = ListaModel<CategoriaModel>()
        categorias.lista.append(CategoriaModel(NSUUID().uuidString,"Restaurantes"))
        categorias.lista.append(CategoriaModel(NSUUID().uuidString,"Parques"))
        categorias.lista.append(CategoriaModel(NSUUID().uuidString,"Veterinarias"))
    
        return categorias
    }
}
