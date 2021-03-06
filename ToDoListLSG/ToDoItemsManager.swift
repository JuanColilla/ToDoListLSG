//
//  ToDoItemsManager.swift
//  ToDoListLSG
//
//  Created by Juan Colilla on 14/03/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//

import Foundation

class ToDoItemsManager {
    
    var items:[ToDoItem]=[ToDoItem]()
    
    func addItems(_ item: ToDoItem){
        self.items.append(item)
    }
 
    func deleteItem(index: Int){
        self.items.remove(at: index)
    }
    
    func markItemAsCompleted(itemIndex: Int){
        self.items[itemIndex].markAsCompleted()
    }
    
}
