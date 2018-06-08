//
//  StoreManager.swift
//  petfriendlyAround
//
//  Created by user139236 on 6/3/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
import RealmSwift

class StoreManager{
    static let sharedInstance = StoreManager()
    static let realm = try! Realm()
    
    func getCategorias() -> Results<CategoriaModel>{
        return StoreManager.realm.objects(CategoriaModel.self)
    }
    func getLugares(porCategoria categoria: Int)-> Results<LugarModel>{
        //let predicate = NSPredicate(format: "categoria.identificador = %@", categoria)
        return StoreManager.realm.objects(LugarModel.self).filter("categoria.identificador = %@", categoria)
        
    }
    func getCategoria(porCategoria categoria: Int)-> CategoriaModel{
        //let predicate = NSPredicate(format: "categoria.identificador = %@", categoria)
        return StoreManager.realm.objects(CategoriaModel.self).filter("identificador = %@", categoria).first!
        
    }
}
