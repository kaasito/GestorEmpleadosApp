//
//  MiPerfilViewController.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 4/2/22.
//

import UIKit

class MiPerfilViewController: UIViewController {

    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var name: UILabel!
    let defaults = UserDefaults.standard
    var myNameValue: String?
    var myMailValue: String?
    var myBiographyValue: String?
    var myJobValue: String?
    var mySalaryValue: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        myNameValue = defaults.string(forKey: "name")!
        myMailValue = defaults.string(forKey: "mail")!
        myBiographyValue = defaults.string(forKey: "biography")!
        myJobValue = defaults.string(forKey: "job")!
        mySalaryValue = defaults.string(forKey: "salary")!
        
        let euro = "€"
        salaryLabel.text = mySalaryValue! + euro
        biographyLabel.text = myBiographyValue!
        jobLabel.text = myJobValue!
        mail.text = myMailValue!
        name.text = myNameValue!
        
    }


}
