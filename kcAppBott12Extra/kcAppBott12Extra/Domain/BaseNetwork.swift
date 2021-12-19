//
//  BaseNetwork.swift
//  kcAppBott12Extra
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 19/12/21.
//

import Foundation

let server = "https://vapor2022.herokuapp.com" //servidor heroku 2022


struct HTTPMethods{
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}


enum endpoints : String {
    case login = "/api/auth/login"
    case herosList = "/api/heros/all"
}


struct BaseNetwork {
    
    
    // Session del login
    func getSessionLogin(user:String, password:String) -> URLRequest {
        let urlCad : String = "\(server)\(endpoints.login.rawValue)"
        let encodeCredencials = "\(user):\(password)".data(using: .utf8)?.base64EncodedString() //base64 USER:PASS en base64 (estandard)
        var segCredential : String = ""
        if let credentials = encodeCredencials{
            segCredential = "Basic \(credentials)"
        }
        
        // creamos el request
        var request : URLRequest = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.post
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type") //Header aplication JSON
        request.addValue(segCredential, forHTTPHeaderField: "Authorization") //Header Basic Authentication
        return request
    }
    
    // Lista de Heroes
    func getSessionHeros(filter:String) -> URLRequest {
        let urlCad : String = "\(server)\(endpoints.herosList.rawValue)"
        var request : URLRequest = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.post
        // generamos el JSON
        request.httpBody = try? JSONEncoder().encode(HerosFilter(name: filter))
        
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type") //Header aplication JSON
        
        //token JWT
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "TOKEN-JWT")
        
        if let tokenJWT = token {
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: "Authorization") //Token
        }
        
        return request
    }
}


