//
//  Dinamic.swift
//  test1
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 18/12/21.
//

import Foundation

//Creamos esta clase que hace lo mismo que hacemos con los estados de pantalla a mostrar, pero todo encapsulado en una clase generica

class BindingObject<T> {
    typealias Binding = (T) -> Void
    
    var value: T
         
    private var binder: Binding? //funcion...
    
    init(_ value: T) {
        self.value = value
    }
    
    //usado para cambiar el valor y que salte la funcion a ejecutar en la view.
    func setValue(value: T){
        self.value = value
        
        if let bind = binder {
            bind(value)
        }
            
    }
    
    func bind(_ binder: @escaping Binding) {
        self.binder = binder
        binder(value)
    }
}
