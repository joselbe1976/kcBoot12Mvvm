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
    
    var rootInteractor : RootInteractorProtocol
    
    init(interactor : RootInteractorProtocol = RootInteractor()){
        self.rootInteractor = interactor
    }
    
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
    
    
    
    //Mensaje de Error
    
    var errorMessage = BindingObject("")
    
    
    
    //Login
    func login(user:String, pass:String){
        
        rootInteractor.login(user: user, pass: pass) {
            //login Success.. cambiamos la vista a Home
            self.errorMessage.setValue(value: "Conectado") //new
            self.viewActive = .Home
        } onError: {
            //Login Error
            self.errorMessage.setValue(value: "Error login")
        }

    }
}
