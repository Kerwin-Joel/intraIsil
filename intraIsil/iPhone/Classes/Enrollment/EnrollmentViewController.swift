//
//  EnrollmentViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/3/21.
//

import UIKit

class EnrollmentViewController: UIViewController {

    
    @IBOutlet weak var lblTitleLabel: UILabel!
    @IBOutlet weak var btnCursos: UIButton!
    @IBOutlet weak var switchAceptar: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func SwitchAceptarM(_ sender: Any) {
        if switchAceptar.isOn == true{
            lblTitleLabel.text = "TU MATRICULA A SIDO ACTIVADA"
            btnCursos.isHidden = false
        } else {
            lblTitleLabel.text = "¿Aceptas el reglamento de matricula?"
            btnCursos.isHidden = true
        }
    }
    

}
