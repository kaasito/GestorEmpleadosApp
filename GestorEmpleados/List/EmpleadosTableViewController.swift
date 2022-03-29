//
//  EmpleadosTableViewController.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 26/1/22.
//

import UIKit
import Alamofire

class EmpleadosTableViewController: UITableViewController {
   
    @IBOutlet var table: UITableView!
    var employees: [User]?
    var token: String?
    var job: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = self
        self.table.dataSource = self
        let defaults = UserDefaults.standard
        job = defaults.string(forKey: "rol")!
        token = defaults.string(forKey: "token")!
        if(job == "empleado"){
            table.isHidden = true
            alerta(title: "No se puede cargar la lista", message: "Los empleados no pueden ver la lista", style: 2, buttonTitle: "Vale")
        }else{
            NetWorkingProvider.shared.getUser(api_token: token!) { arrayUsuarios in
                self.employees = arrayUsuarios
                self.table.reloadData()
            } failure: { error in
                print(error)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.table.delegate = self
        self.table.dataSource = self
        let defaults = UserDefaults.standard
        job = defaults.string(forKey: "rol")!
        token = defaults.string(forKey: "token")!
        if(job == "empleado"){
            table.isHidden = true
            alerta(title: "No se puede cargar la lista", message: "Los empleados no pueden ver la lista", style: 2, buttonTitle: "Vale")
        }else{
            NetWorkingProvider.shared.getUser(api_token: token!) { arrayUsuarios in
                self.employees = arrayUsuarios
                self.table.reloadData()
            } failure: { error in
                print(error)
            }
        }
        
        self.table.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EmpleadoTableViewCell
         
            cell.user = employees?[indexPath.row]
        
           return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "InfoViewController") as? InfoViewController {
            let user = employees?[indexPath.row]
            vc.name = (user?.name)!
            vc.job = (user?.puesto)!
            vc.mail = (user?.email)!
            vc.salary = (user?.salario)!
            vc.bio = (user?.biografia)!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
   
    
    public func alerta(title: String, message: String, style: Int, buttonTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style(rawValue: style)!, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
            @unknown default:
                print("fatalError")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
  
   

}
