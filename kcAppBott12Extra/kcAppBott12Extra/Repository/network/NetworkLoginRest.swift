//
//  NetworkLoginRest.swift
//  kcAppBott12Extra
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 19/12/21.
//

import Foundation

struct NetworkLoginRest{
    func login(user:String, pass:String, onSuccess: @escaping successClosureString, onError: errorClosure) {
        
        let request = BaseNetwork().getSessionLogin(user: user, password: pass)
        
        URLSession.shared.dataTask(with: request){ data, response, error in
           
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }
            
            if (httpResponse.statusCode == 200){
                //buscamos el JSON
                if let token = data {
                    onSuccess(String(decoding: token, as: UTF8.self))
                } else {
                    onError!()
                }
            
            } else {
                onError!()
            }
            
            
        }.resume()
        
    }
}
