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
    @IBOutlet weak var biographyField: UITextField!
    @IBOutlet weak var salaryField: UITextField!
    @IBOutlet weak var jobField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    var nombreEditar:String?
    var e_mailEditar:String?
    var empleoEditar:String?
    var salaryEditar:Int?
    var bioEditar:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.text = nombreEditar
        mailField.text = e_mailEditar
        jobField.text = empleoEditar
        salaryField.text = (String(describing: salaryEditar))
        biographyField.text = bioEditar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        nameField.text = nombreEditar
        mailField.text = e_mailEditar
        jobField.text = empleoEditar
        salaryField.text = (String(describing: salaryEditar))
        biographyField.text = bioEditar
    }
    
    @IBAction func editUserButtonPressed(_ sender: Any) {
        editUser()
    }
 
    func editUser(){
        let nombre = nameField.text
        let email = mailField.text
        let empleo = jobField.text
        let salario = salaryField.text
        let bio = biographyField.text
        let token = defaults.string(forKey: "token")
        let url: URLConvertible! = URL(string:
                                        "http://localhost:8888/gestor-empleados/public/api/user/modificarEmpleado")!

        let json = [ "email_editar": e_mailEditar,
                     "api_token": token,
                     "name": nombre,
                     "puesto": empleo,
                     "email": email,
                     "salario": salario,
                     "biografia": bio ]
        
        AF.request(url, method: .post, parameters: json as Parameters, encoding: JSONEncoding.default, headers: nil).responseDecodable(of: Response.self){ [self]
            response in
            let msg = response.value?.msg
            let status = response.value?.status
            
            if status == 0{
                alerta(title: "No se ha editado el trabajador", message: msg!, style: 2, buttonTitle: "Vale")
            }
            if status == 1{
                alerta(title:"Se ha editado el trabajador", message: "Todo ha salido en orden", style: 0, buttonTitle: "Vale")
            }
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
