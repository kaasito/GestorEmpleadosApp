//
//  MiPerfilViewController.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 4/2/22.
//

import UIKit

class MiPerfilViewController: UIViewController {

    
    
    @IBOutlet weak var baiografi: UILabel!
    @IBOutlet weak var salarylable: UILabel!
    @IBOutlet weak var puesstolabel: UILabel!
    @IBOutlet weak var correo: UILabel!
    @IBOutlet weak var name: UILabel!
    let defaults = UserDefaults.standard
    var namepropio:String = ""
    var correopropio:String = ""
    var biopropia:String = ""
    var puestopropio:String = ""
    var salariopropio:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        namepropio = defaults.string(forKey: "nombre")!
        correopropio = defaults.string(forKey: "correo")!
        biopropia = defaults.string(forKey: "bio")!
        puestopropio = defaults.string(forKey: "rol")!
        salariopropio = defaults.string(forKey: "salario")!
        
        salarylable.attributedText = NSMutableAttributedString().bold("Tu salario: ").normal(salariopropio)
        baiografi.attributedText = NSMutableAttributedString().bold("Tu salario: ").normal(biopropia)
        puesstolabel.attributedText = NSMutableAttributedString().bold("Tu puesto: ").normal(puestopropio)
        correo.attributedText = NSMutableAttributedString().bold("Tu E-mail: ").normal(correopropio)
        name.attributedText = NSMutableAttributedString().bold("Tu nombre: ").normal(namepropio)
        
        
        /*
         
         
         @IBOutlet weak var salarylable: UILabel!
         @IBOutlet weak var baiografi: UILabel!
         @IBOutlet weak var puesstolabel: UILabel!
         @IBOutlet weak var correo: UILabel!
         @IBOutlet weak var name: UILabel!
         
         defaults.set(token, forKey: "token")
         defaults.set(empleo, forKey: "rol")
         defaults.set(correo, forKey: "correo")
         defaults.set(name, forKey: "nombre")
         defaults.set(bio, forKey: "bio")
         defaults.set(salary, forKey: "salario")
         */
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
