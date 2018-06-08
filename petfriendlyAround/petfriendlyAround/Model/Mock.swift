//
//  Mock.swift
//  petfriendlyAround
//
//  Created by user139236 on 6/7/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import Foundation
import RealmSwift

class Mock: Object {
    @objc dynamic var id = "Carga"
    @objc dynamic var descripcion = "Mock que indica la primera vez que se hicieron las cargas"
    @objc dynamic var cargado = false
    override static func primaryKey() -> String? {
        return "id"
    }
}
