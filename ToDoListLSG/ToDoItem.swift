//
//  ToDoItem.swift
//  ToDoListLSG
//
//  Created by Juan Colilla on 14/03/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//

import Foundation

class ToDoItem {
    
    //Propiedades
    var name: String
    var completed: Bool
    var creationDate: Date
    var completitionDate: Date? //Opcional: Puede no tener valor.
    
    
    //Inicializador
    init(name: String){
        
    self.name = name
    self.completed = false
    self.creationDate = Date()
        
    }
    
    //Funciones
    func markAsCompleted() {
        
        self.completed=(completed ? false:true)
        
        if (self.completed) {
            self.completitionDate = Date()
        } else {
            self.completitionDate = nil
        }
        
    }
    
}
