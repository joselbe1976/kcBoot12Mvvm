//
//  Dinamic.swift
//  test1
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 18/12/21.
//

import Foundation


class DynamicVariable<T> {
    typealias Binding = (T) -> Void
    
    var value: T
         
    private var binder: Binding?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bindAndFire(_ binder: @escaping Binding) {
        self.binder = binder
        binder(value)
    }
}
