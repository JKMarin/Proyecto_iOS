//
//  StoreManager.swift
//  petfriendlyAround
//
//  Created by user139236 on 6/3/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
class StoreManager{
    static let sharedInstance = StoreManager()
    
    func getCategorias() -> ListaModel<CategoriaModel>{
        return StoreMockUp.listarCategorias()
    }
}
