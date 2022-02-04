//
//  EmpleadoTableViewCell.swift
//  GestorEmpleados
//
//  Created by Lucas Romero Magaña on 26/1/22.
//

import UIKit

class EmpleadoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var biografiaLabel: UILabel!
    @IBOutlet weak var salarioLabel: UILabel!
    @IBOutlet weak var puestoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nombreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
