//
//  InfoViewController.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 3/2/22.
//

import UIKit

class InfoViewController: UIViewController {

    
  
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelPuesto: UILabel!
    
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var labelBiografia: UILabel!
    @IBOutlet weak var labelSalario: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    var name:String = ""
    var e_mail:String = ""
    var empleo:String = ""
    var salary:Double = 0
    var bio:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stack.layer.cornerRadius = 10
        stack.layer.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.8392156863, blue: 0.8392156863, alpha: 1)
        labelName.attributedText = NSMutableAttributedString().bold("Nombre: ").normal("\(name)")
        labelEmail.attributedText = NSMutableAttributedString().bold("Email: ").normal("\(e_mail)")
        labelPuesto.attributedText = NSMutableAttributedString().bold("Puesto: ").normal("\(empleo)")
        labelSalario.attributedText = NSMutableAttributedString().bold("Salario: ").normal("\(salary)")
        labelBiografia.attributedText = NSMutableAttributedString().bold("Bio: ").normal("\(bio)")
     
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "fromInfo"){
            let secondView = segue.destination as! EditViewController
            secondView.nombreEditar = name
            secondView.e_mailEditar = e_mail
            secondView.empleoEditar = empleo
            secondView.salaryEditar = salary
            secondView.bioEditar = bio
        }
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
