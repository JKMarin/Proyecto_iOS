//
//  StoreMockUp.swift
//  petfriendlyAround
//
//  Created by user139236 on 6/3/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
import RealmSwift
class StoreMockUp{
    
    static func cargaInicial(){
        /// Use them like regular Swift objects
        let mock: Mock
        //mock.cargado=false
        let realm = StoreManager.realm
       try! realm.write {
            realm.deleteAll()
        }
        if let selectMocks = realm.objects(Mock.self).filter("id = 'Carga' AND cargado = true") as? Results<Mock>, selectMocks.count > 0{
            print("Ya la Carga Inicial fue realizada...")
        }
        else{
           
            print("Comenzando Carga Inicial...")
            let categorias = [
               CategoriaModel(1,"Restaurantes"),
               CategoriaModel(2,"Parques"),
               CategoriaModel(3,"Veterinarias")
            ]
            try! realm.write {
                for categoria in categorias{
                    realm.add(categoria, update: true)
                }
            }
           
            let lugares = [
               LugarModel(NSUUID().uuidString, "Cafénauta", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), ( 9.9375973, -84.0754965)),
               LugarModel(NSUUID().uuidString, "50mm GastroPub & Café", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), ( 9.9538721,-84.0512316)),
               LugarModel(NSUUID().uuidString, "Maza Bistro", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.9344798,-84.071953)),
               LugarModel(NSUUID().uuidString, "Heladería Rey Cacao", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.9296904,-84.1457384)),
               LugarModel(NSUUID().uuidString, "Freddo Fresas", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (10.1572134,-84.1978187)),
               LugarModel(NSUUID().uuidString, "El Búho Vegetariano", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.934349,-84.0527078)),
               LugarModel(NSUUID().uuidString, "Bulali", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.9378731,-84.1453781)),
               LugarModel(NSUUID().uuidString, "Na Praia", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), ( 9.9346469,-84.0598354)),
               LugarModel(NSUUID().uuidString, "Bici Tienda y Café Las Luciérnagas", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.929829,-84.0496657)),
               LugarModel(NSUUID().uuidString, "Mercado Escalante", "Mercado Escalante", CategoriaModel(2, "Parques"), (9.933550, -84.065354)),
               LugarModel(NSUUID().uuidString, "Parque de perros Lourdes", " Parque de perros Lourdes ", CategoriaModel(2, "Parques"), (9.930094, -84.036566)),
               LugarModel(NSUUID().uuidString, "Medifauna", " Medifauna ", CategoriaModel(3, " Veterinarias "), (9.965871, -84.041725)),
               LugarModel(NSUUID().uuidString, "Intensivet", " Intensivet ", CategoriaModel(3, " Veterinarias "), (9.935117, -84.120134)),
               LugarModel(NSUUID().uuidString, "Dr. Robert Hospital Veterinario", "Dr. Robert Hospital Veterinario", CategoriaModel(3, "Veterinarias"), (9.922154, -84.037529))
            ]
            
            try! realm.write {
                for lugar in lugares{
                    realm.add(lugar, update: true)
                }
            }
            let test = realm.objects(LugarModel.self)
            for x in test{
                print(x.nombre)
                let y = x.categoria
                let lo = x.longitud
                let la = x.latitud
                
                print(y?.identificador)
                print(y?.nombre)
                print(lo)
                print(la)
            }
            let mock = Mock()
            mock.cargado = true
            try! realm.write {
               realm.add(mock, update: true)
               
            }
            print("Finaliza Carga Inicial...")
        }
       // print("La carga inicial ID:\(mock.id) contiene \(selectMocks.count) registros")
        //
        /*
        try! realm.write {
            // Updating selectMocks with id = 'Carga'
            realm.add(mock, update: true)
            
        }*/
        //print("La carga inicial ID:\(mock.id) contiene \(selectMocks.count) registros")
    }
    /*static func listarCategorias() -> [CategoriaModel]{
        let categorias = [CategoriaModel] = []
        categorias.append(CategoriaModel(1,"Restaurantes"))
        categorias.append(CategoriaModel(2,"Parques"))
        categorias.append(CategoriaModel(3,"Veterinarias"))
    
        return categorias
    }
    static func getLugares(porCategoria categoria:Int) -> ListaModel<LugarModel> {
        let lugares = ListaModel<LugarModel>()
        lugares.append(LugarModel(NSUUID().uuidString, "Cafénauta", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), ( 9.9375973, -84.0754965)))
        lugares..append(LugarModel(NSUUID().uuidString, "50mm GastroPub & Café", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), ( 9.9538721,-84.0512316)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "Maza Bistro", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.9344798,-84.071953)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "Heladería Rey Cacao", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.9296904,-84.1457384)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "Freddo Fresas", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (10.1572134,-84.1978187)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "El Búho Vegetariano", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.934349,-84.0527078)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "Bulali", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.9378731,-84.1453781)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "Na Praia", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), ( 9.9346469,-84.0598354)))
        lugares.lista.append(LugarModel(NSUUID().uuidString, "Bici Tienda y Café Las Luciérnagas", "Cafeteria Cafenauta", CategoriaModel(1, "Restaurantes"), (9.929829,-84.0496657)))
        return lugares
    }*/
}
