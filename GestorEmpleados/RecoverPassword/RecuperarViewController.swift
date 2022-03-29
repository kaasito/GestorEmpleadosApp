//
//  RecuperarViewController.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 3/2/22.
//

import UIKit
import Alamofire

class RecuperarViewController: UIViewController {
    let defaults = UserDefaults.standard
    @IBOutlet weak var mailLabel: UITextField!
    
    
    @IBAction func recoverPasswordPressed(_ sender: Any) {
        let introducedMail = mailLabel.text
        let myMail = defaults.string(forKey: "mail")
        
        if introducedMail == myMail{
            recoverPassword(introducedMail: introducedMail!)
        }
       
        if(introducedMail == ""){
            emptyMail()
        }
        
        if(introducedMail != myMail){
            wrongMail()
        }
    }
  
    func recoverPassword(introducedMail: String){
        let url = URL(string:"http://localhost:8888/gestor-empleados/public/api/user/recuperarPass")!
        let json = ["email": introducedMail]
        
        AF.request(url, method: .post, parameters: json as Parameters, encoding: JSONEncoding.default, headers: nil).responseDecodable(of: Response.self){ [self]
            response in
            
            if response.value?.status == 1{
                let alert = UIAlertController(title: "Contraseña cambiada con éxito, has recibido un email", message: "Revisa tu bandeja de entrada", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Genial", style: .default, handler: { action in
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
            
            if response.value?.status == 401{
                let alert = UIAlertController(title: "Api Token no válido", message: "Contraseña no cambiada", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Genial", style: .default, handler: { action in
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
            
            if response.value?.status == 0{
                let alert = UIAlertController(title: "No se ha podido cambiar la contraseña", message: "Algo ha salido mal", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Vale", style: .destructive, handler: { action in
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
    }
    
    func emptyMail(){
        let alert = UIAlertController(title: "No se ha editado la contraseña", message: "Tienes que introducir algún email", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Vale", style: .destructive, handler: { action in
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
    
    func wrongMail(){
          let alert = UIAlertController(title: "No se ha editado la contraseña", message: "El email introducido no coincide con el tuyo", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "Vale", style: .destructive, handler: { action in
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



