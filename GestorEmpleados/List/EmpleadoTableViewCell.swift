//
//  EmpleadoTableViewCell.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 26/1/22.
//

import UIKit

class EmpleadoTableViewCell: UITableViewCell {

    var user: User? {
        didSet {
            renderUI()
        }
    }
    
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    private func renderUI() {
        guard let user = user else { return }
        
        nameLabel.text = user.name
        jobLabel.text = user.puesto
        mailLabel.text = user.email
        salaryLabel.text = String(user.salario!)
        biographyLabel.text = user.biografia
    }
}
