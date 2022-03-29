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

    var token: String?
    var job: String?
    var bio: String?
    var name: String?
    var salary: Double?
    var mail: String?
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var nickname: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.backgroundColor = #colorLiteral(red: 1, green: 0.4941176471, blue: 0.4745098039, alpha: 1)
        logInButton.layer.cornerRadius = 10
    }
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        logIn()
    }
    
    func logIn(){
        mail = nickname.text!
        let password = password.text
        let url: URLConvertible! = URL(string:
                                        "http://localhost:8888/gestor-empleados/public/api/user/login")!

        let json = ["email": mail, "password": password]

        AF.request(url, method: .post, parameters: json as Parameters, encoding: JSONEncoding.default, headers: nil).responseDecodable(of: Response.self){ [self]
            response in
            
            if((response.value?.token) != nil){
                self.token = response.value!.token!
                self.job = response.value!.puesto!
                self.name = response.value!.nombre!
                self.salary = response.value!.salario!
                self.bio = response.value!.bio!
                defaults.set(token, forKey: "token")
                defaults.set(job, forKey: "job")
                defaults.set(mail, forKey: "mail")
                defaults.set(name, forKey: "name")
                defaults.set(bio, forKey: "biography")
                defaults.set(salary, forKey: "salary")
                
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
}
