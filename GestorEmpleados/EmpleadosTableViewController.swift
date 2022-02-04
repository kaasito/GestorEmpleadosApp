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
    var nombreArray: [String] = []
    var salarioArray: [Double] = []
    var puestoArray: [String] = []
    var emailArray: [String] = []
    var bioArray: [String] = []
    var token: String = ""
    var empleo: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
                for i in arrayUsuarios{
                    self.nombreArray.append(i.name!)
                    self.salarioArray.append(i.salario!)
                    self.puestoArray.append(i.puesto!)
                    self.emailArray.append(i.email!)
                    self.bioArray.append(i.biografia!)
                    self.tabla.reloadData()
                }
            } failure: { error in
                print(error)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nombreArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EmpleadoTableViewCell
         
        cell.nombreLabel.text = self.nombreArray[indexPath.row]
        cell.puestoLabel.text = self.puestoArray[indexPath.row]
        cell.emailLabel.text = self.emailArray[indexPath.row]
        cell.salarioLabel.text = String(self.salarioArray[indexPath.row])
        cell.biografiaLabel.text = self.bioArray[indexPath.row]
         
         
           return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "InfoViewController") as? InfoViewController {
            vc.name = nombreArray[indexPath.row]
            vc.empleo = puestoArray[indexPath.row]
            vc.e_mail = emailArray[indexPath.row]
            vc.salary = salarioArray[indexPath.row]
            vc.bio = bioArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
   

}
