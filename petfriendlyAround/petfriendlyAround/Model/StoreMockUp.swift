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
        categorias.lista.append(CategoriaModel(1,"Restaurantes"))
        categorias.lista.append(CategoriaModel(2,"Parques"))
        categorias.lista.append(CategoriaModel(3,"Veterinarias"))
    
        return categorias
    }
    static func getLugares(porCategoria categoria:Int) -> ListaModel<LugarModel> {
        let lugares = ListaModel<LugarModel>()
        lugares.lista.append(LugarModel(NSUUID().uuidString, "Cafénauta", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), ( 9.9375973, -84.0754965)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "50mm GastroPub & Café", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), ( 9.9538721,-84.0512316)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "Maza Bistro", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.9344798,-84.071953)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "Heladería Rey Cacao", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.9296904,-84.1457384)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "Freddo Fresas", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (10.1572134,-84.1978187)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "El Búho Vegetariano", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.934349,-84.0527078)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "Bulali", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.9378731,-84.1453781)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "Na Praia", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), ( 9.9346469,-84.0598354)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "Bici Tienda y Café Las Luciérnagas", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.929829,-84.0496657)))
        return lugares
    }
}
