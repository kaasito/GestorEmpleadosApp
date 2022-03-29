//
//  ViewController.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 25/1/22.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registrarboton: UIButton!
    @IBOutlet weak var biography: UITextField!
    @IBOutlet weak var salario: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var puesto: UITextField!
    @IBOutlet weak var nombre: UITextField!
    
    var api_token: String?
    var rol: String?
   
    @IBAction func registerUserButtonPressed(_ sender: Any) {
        registerUser()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromRegister"{
            let segundaVista = segue.destination as! EmpleadosTableViewController
            segundaVista.token = api_token!
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
    
    func registerUser(){
        let biografiatexto = biography.text
        let salariofiatexto = salario.text
        let passwordfiatexto = password.text
        let emailtexto = email.text
        let puestotexto = puesto.text
        let nombretexto = nombre.text
        let url = URL(string:
                        "http://localhost:8888/gestor-empleados/public/api/user/registrar")
        
        let json = [ "name": nombretexto,
                     "puesto": puestotexto,
                     "password": passwordfiatexto,
                     "email": emailtexto,
                     "salario": salariofiatexto,
                     "biografia": biografiatexto ]
        
        AF.request(url!, method: .post, parameters: json as Parameters, encoding: JSONEncoding.default, headers: nil).responseDecodable(of: Response.self){ [self]
            response in
            
            if((response.value?.status) == 1){
                self.api_token = (response.value?.token)!
                alerta(title: "Usuario Registrado con Éxito", message: "Ya se ha agregado a la base de datos", style: 0, buttonTitle: "Vale")
            }else{
                let mensaje:String = (response.value?.msg)!
                alerta(title: "Ha habido un error", message: mensaje, style: 2, buttonTitle: "Vale")
            }
        }
    }
}
