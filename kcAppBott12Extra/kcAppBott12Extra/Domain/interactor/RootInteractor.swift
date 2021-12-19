//
//  RootInteractor.swift
//  kcAppBott12Extra
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 19/12/21.
//

import Foundation


enum StatusLogin{
    case Success
    case Error
}

//protocolo
protocol RootInteractorProtocol: AnyObject {
    func login (user:String, pass:String, onSuccess: @escaping successClosure, onError: errorClosure)
    
}

//interactor
final class RootInteractor : RootInteractorProtocol {
    func login(user: String, pass: String , onSuccess: @escaping successClosure, onError: errorClosure) {
        
        NetworkLoginRest().login(user: user, pass: pass) { token in
            //succes con el token
            DispatchQueue.main.async {
                
                //Grabanmos el token
                let defaults = UserDefaults.standard
                defaults.set(token, forKey: "TOKEN-JWT") //grabamos el token
                
                //ejecutamos el closure
                onSuccess()
            }
        } onError: {
            //Error
            DispatchQueue.main.async {
                onError!()
            }
        }

    }
    
    
}


//interactor test para el Testing
final class RootInteractorTesting : RootInteractorProtocol {
    func login(user: String, pass: String, onSuccess: @escaping successClosure, onError: errorClosure){
        onSuccess()
    }
    
    
}
