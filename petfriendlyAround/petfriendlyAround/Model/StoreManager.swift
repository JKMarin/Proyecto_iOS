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
    func getUsuario(login correo: String)-> UsuarioModel?{
        let usuario = StoreManager.realm.objects(UsuarioModel.self).filter("correo = %@", correo)
        if usuario.count == 0{
            return nil
        }
        else{
            return usuario.first
        }
        
        
    }
    func autenticar(login correo: String, password contrasenna:String)-> Bool{
        let usuario = StoreManager.realm.objects(UsuarioModel.self).filter("correo = %@ AND contrasenna = %@", correo,contrasenna)
        if usuario.count == 0{
            return false
        }
        else{
            return true
        }
        
    }
    func existeUsuario(login correo: String)-> Bool{
        let usuario = StoreManager.realm.objects(UsuarioModel.self).filter("correo = %@", correo)
        if usuario.count == 0{
            return false
        }
        else{
            return true
        }
        
    }
    func crearUsuario(usuario: UsuarioModel){
        try! StoreManager.realm.write {
            StoreManager.realm.add(usuario, update: true)
            
        }
    }
    func eliminarUsuario(usuario: UsuarioModel){
        try! StoreManager.realm.write {
            StoreManager.realm.delete(usuario)
            
        }
    }
    func cambiarContrasenaUsuario(login correo: String, password contrasena: String, nuevopass nuevacontrasena:String)-> Bool{
        let usuario = StoreManager.realm.objects(UsuarioModel.self).filter("correo = %@ AND contrasenna = %@", correo,contrasena)
        if usuario.count == 0{
            return false
        }
        else{
            try! StoreManager.realm.write {
                StoreManager.realm.create(UsuarioModel.self,value: ["correo":correo,"contrasenna":nuevacontrasena], update: true)
                
            }
            return true
        }
    }
}
