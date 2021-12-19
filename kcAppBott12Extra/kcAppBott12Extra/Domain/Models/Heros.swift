//
//  Heros.swift
//  kcAppBott12Extra
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 19/12/21.
//

import Foundation

struct Heros: Codable , Identifiable{
    var id:UUID
    var name: String
    var description: String
    var photo:String //Es una URL
    var favorite:Bool? // si el developer conectado ha marcado como favorito
}

// para la llamada al servidor, que hay que pasar un Filtro.
struct HerosFilter: Codable {
    var name: String
}
