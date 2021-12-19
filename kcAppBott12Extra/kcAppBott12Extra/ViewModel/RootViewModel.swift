//
//  RootViewModel.swift
//  test1
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 18/12/21.
//

import Foundation


enum viewsStatus {
    case Login
    case Home
    case Register
}

final class RootViewModel{
    
    //estado
    var viewActive: viewsStatus = .Login{
        didSet{
            print("New valor asignado: \(viewActive)")
            
            //llamamos al evento solo cuando cambia respecto al anterior
            if oldValue != viewActive {
                self.onViewChange?() //llamamos a la funcion
            }
        }
    }

    //Definimos una variable de tipo funcion que no recibe argumentos, y no devuelve nada... Despues en el SceneDelegate, le asignarmeos el codigo de la funcion...
    var onViewChange: (() -> Void)?
    
}
