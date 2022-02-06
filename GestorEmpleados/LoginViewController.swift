//
//  LoginViewController.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 25/1/22.
//

import UIKit
import Alamofire
import Foundation

class LoginViewController: UIViewController {

    var token: String = ""
    var empleo: String = ""
    var bio: String = ""
    var name: String = ""
    var salary: Double = 0
    var correo: String = ""
    let defaults = UserDefaults.standard
    @IBOutlet weak var passs: UITextField!
    
    @IBOutlet weak var nickname: UITextField!
    @IBOutlet weak var logearseBoton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logearseBoton.layer.backgroundColor = #colorLiteral(red: 1, green: 0.4941176471, blue: 0.4745098039, alpha: 1)
        logearseBoton.layer.cornerRadius = 10


        
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func botoon(_ sender: Any) {
        correo = nickname.text!
        let password = passs.text
        let url: URLConvertible! = URL(string:
                                        "http://localhost:8888/gestor-empleados/public/api/user/login")!

        let json = ["email": correo, "password": password]

        AF.request(url, method: .post, parameters: json as Parameters, encoding: JSONEncoding.default, headers: nil).responseDecodable(of: Response.self){ [self]
            response in
            
            if((response.value?.token) != nil){
                self.token = response.value!.token!
                self.empleo = response.value!.puesto!
                self.name = response.value!.nombre!
                self.salary = response.value!.salario!
                self.bio = response.value!.bio!
                defaults.set(token, forKey: "token")
                defaults.set(empleo, forKey: "rol")
                defaults.set(correo, forKey: "correo")
                defaults.set(name, forKey: "nombre")
                defaults.set(bio, forKey: "bio")
                defaults.set(salary, forKey: "salario")
                performSegue(withIdentifier: "fromLogin", sender: nil)
            }else{
                let alert = UIAlertController(title: "No se ha hecho LogIn", message: "Ha habido algún problema", preferredStyle: .alert)
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
    
    
   
    
    struct Response: Decodable{
        let token: String?
        let puesto: String?
        let nombre: String?
        let email: String?
        let salario: Double?
        let bio: String?
    }
    /*
     $respuesta["token"] = $token;
               $respuesta["nombre"] = $usuario->name;
               $respuesta["puesto"] = $usuario->puesto;
               $respuesta["salario"] = $usuario->salario;
               $respuesta["email"] = $usuario->email;
               $respuesta["bio"] = $usuario->biografia;
    */

}
