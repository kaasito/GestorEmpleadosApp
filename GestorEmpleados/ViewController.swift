//
//  ViewController.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 25/1/22.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    
    var api_token: String = ""
    var rol: String = ""
    @IBOutlet weak var biografia: UITextField!
    @IBOutlet weak var salario: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var puesto: UITextField!
    @IBOutlet weak var nombre: UITextField!
    
    @IBOutlet weak var registrarboton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func boton(_ sender: Any) {
        let biografiatexto = biografia.text
        let salariofiatexto = salario.text
        let passwordfiatexto = password.text
        let emailtexto = email.text
        let puestotexto = puesto.text
        let nombretexto = nombre.text
        let url = URL(string:
                        "http://localhost:8888/gestor-empleados/public/api/user/registrar")
        
        let json = ["name": nombretexto, "puesto": puestotexto, "password": passwordfiatexto, "email": emailtexto, "salario": salariofiatexto, "biografia": biografiatexto]
        AF.request(url!, method: .post, parameters: json as Parameters, encoding: JSONEncoding.default, headers: nil).responseDecodable(of: Respuesta.self){ [self]
            response in
            
            if((response.value?.token) != nil){
                self.api_token = (response.value?.token)!
                print(api_token)
                let alert = UIAlertController(title: "Usuario creado con éxito", message: "El usuario se ha registrado exitosamente", preferredStyle: .alert)
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
                
            }else{
                let mensaje:String = (response.value?.msg)!
                let alert = UIAlertController(title: "Error en el registro", message: mensaje, preferredStyle: .alert)
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
           
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromRegister"{
            let segundaVista = segue.destination as! EmpleadosTableViewController
           segundaVista.token = api_token
        }
    }
    
    
    struct Respuesta: Codable{
        let nombre: String?
        let puesto: String?
        let email: String?
        let salario: Double?
        let password:String?
        let bio: String?
        let token: String?
        let msg: String?
        let status: Int?
    }
    
}
