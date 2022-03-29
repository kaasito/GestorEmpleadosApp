//
//  InfoViewController.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 3/2/22.
//

import UIKit

class InfoViewController: UIViewController {

    
  
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelJob: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var labelBiography: UILabel!
    @IBOutlet weak var labelSalary: UILabel!
    @IBOutlet weak var labelMail: UILabel!
    var name:String?
    var mail:String?
    var job:String?
    var salary:Int?
    var bio:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.layer.cornerRadius = 10
        stackView.layer.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.8392156863, blue: 0.8392156863, alpha: 1)
        labelName.text = name!
        labelMail.text = mail!
        labelJob.text = job!
        labelSalary.text = "\(salary!)"
        labelBiography.text = bio!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "fromInfo"){
            let secondView = segue.destination as! EditViewController
            secondView.nombreEditar = name!
            secondView.e_mailEditar = mail!
            secondView.empleoEditar = job!
            secondView.salaryEditar = salary!
            secondView.bioEditar = bio!
        }
    }

}
