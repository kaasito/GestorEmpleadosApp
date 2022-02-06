//
//  EditViewController.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 5/2/22.
//

import UIKit
import Alamofire

class EditViewController: UIViewController {

    
    let defaults = UserDefaults.standard
    @IBOutlet weak var bioField: UITextField!
    @IBOutlet weak var salaryField: UITextField!
    @IBOutlet weak var empleoField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nombreField: UITextField!
    var nombreEditar = ""
    var e_mailEditar = ""
    var empleoEditar = ""
    var salaryEditar:Double = 0
    var bioEditar = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombreField.text = nombreEditar
        emailField.text = e_mailEditar
        empleoField.text = empleoEditar
        salaryField.text = "\(salaryEditar)"
        bioField.text = bioEditar
    }
    
    @IBAction func modificarBoton(_ sender: Any) {
        let nombre = nombreField.text
        let email = emailField.text
        let empleo = empleoField.text
        let salario = salaryField.text
        let bio = bioField.text
        let token = defaults.string(forKey: "token")
        let url: URLConvertible! = URL(string:
                                        "http://localhost:8888/gestor-empleados/public/api/user/modificarEmpleado")!

        let json = ["email_editar": e_mailEditar ,"api_token": token, "name": nombre, "puesto": empleo,"email": email,"salario": salario ,"biografia": bio ]
        
        /*
         "api_token": "$2y$10$wQVc03dDrE57WCNeCw5vdubmxxOQieQa.3TeY9qebSYJGkdsh4uXC",
            "email_editar": "sisis@gmail.com",
            "name": "Juan x",
            "puesto":"empleado",
            "password": "Lui$11",
            "email":"lukitas@gmail.com",
            "salario": "3",
            "biografia": "sinosino"
         */
        
        AF.request(url, method: .post, parameters: json as Parameters, encoding: JSONEncoding.default, headers: nil).responseDecodable(of: Response.self){ [self]
            response in
            let msg = response.value?.msg
            let status = response.value?.status
            
            if status == 0{
                let alert = UIAlertController(title: "No se ha editado el trabajador", message: msg, preferredStyle: .alert)
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
            }
            
            if status == 1{
                let alert = UIAlertController(title: "Se ha editado el trabajador", message: msg, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Vale", style: .default, handler: { action in
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
            }
            
           
        }
    }
    
    struct Response: Decodable{
        let msg:String
        let status:Double
    }
    /*
    
    
     "email_editar": "no@gmail.com",
         "name": "Juan x",
         "puesto":"empleado",
         "password": "Lui$11",
         "email":"lukitas@gmail.com",
         "salario": "3",
         "biografia": "sinosino"
     
    */

}
