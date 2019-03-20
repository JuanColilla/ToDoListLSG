//
//  ToDoListTableTableViewController.swift
//  ToDoListLSG
//
//  Created by Juan Colilla on 14/03/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//

import UIKit

class ToDoListTableTableViewController: UITableViewController {
    
    var toDoItemsManager: ToDoItemsManager = ToDoItemsManager()

    var newItem: ToDoItem?
    
    @IBAction func goBack(segue: UIStoryboardSegue) {
        if let aNewItem = newItem{
            
            //update var newItem to nil for future add actions:
            self.newItem = nil
            
            //update the model data source:
            toDoItemsManager.addItems(aNewItem)
            
            //update the view:
            tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoItemsManager.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        
        //Obtener el ToDoItem para indexPath
        let item: ToDoItem = toDoItemsManager.items[indexPath.row]

        // Configure the cell...
        // Actualizar el titulo de la celda.
        cell.textLabel?.text = item.name
        
        // Actualizar el subtítulo de la celda.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        cell.detailTextLabel?.text = dateFormatter.string(from: item.creationDate)
        
        // Actualizar accesorio de la celda.
        if item.completed{
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        } else {
            cell.accessoryType = UITableViewCell.AccessoryType.none
        }
        
        return cell
        
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            toDoItemsManager.deleteItem(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        toDoItemsManager.markItemAsCompleted(itemIndex: indexPath.row)
        tableView.reloadData()
    }
    
    
    
    
    
    
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
