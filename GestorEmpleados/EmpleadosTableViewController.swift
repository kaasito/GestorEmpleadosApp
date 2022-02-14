//
//  EmpleadosTableViewController.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 26/1/22.
//

import UIKit
import Alamofire

class EmpleadosTableViewController: UITableViewController {
   
    
    @IBOutlet var tabla: UITableView!
    var empleados: [User]?
    var token: String = ""
    var empleo: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabla.reloadData()
        self.tabla.delegate = self
        self.tabla.dataSource = self
        let defaults = UserDefaults.standard
        empleo = defaults.string(forKey: "rol")!
        token = defaults.string(forKey: "token")!
        
        if(empleo == "empleado"){
            tabla.isHidden = true
            let alert = UIAlertController(title: "No se puede cargar la lista", message: "Los empleados no pueden ver la lista", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Vale", style: .destructive, handler: { action in
                switch action.style{
                    case .default:
                    print("default")
                    
                    case .cancel:
                    print("cancel")
                    
                    case .destructive:
                    print("destructive")
                    
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }else{
            NetWorkingProvider.shared.getUser(api_token: token) { arrayUsuarios in
                self.empleados = arrayUsuarios
              
                
            } failure: { error in
                print(error)
            }
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tabla.reloadData()
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empleados?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EmpleadoTableViewCell
         
            cell.user = empleados?[indexPath.row]
        
           return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "InfoViewController") as? InfoViewController {
            var user = empleados?[indexPath.row]
           
            vc.name = (user?.name)!
            vc.empleo = (user?.puesto)!
            vc.e_mail = (user?.email)!
            vc.salary = (user?.salario)!
            vc.bio = (user?.biografia)!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
  
   

}
