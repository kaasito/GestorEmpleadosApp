//
//  ListaEmpleadosViewController.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 25/1/22.
//

import UIKit
import Alamofire
class ListaEmpleadosViewController: UITableViewController {

    
    @IBOutlet weak var tabla: UITableView!
    let usuarios: Array<User> = []
    var token: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabla.delegate = self
        self.tabla.dataSource = self
        
    }
    
  
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EmpleadoTableViewCell
         
        
          
           
       
        
        
         
           return cell
    }
    
   
    
}
