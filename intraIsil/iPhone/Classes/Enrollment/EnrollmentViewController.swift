//
//  EnrollmentViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/3/21.
//

import UIKit

class EnrollmentViewController: UIViewController {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var CursosButton: UIButton!
    @IBOutlet weak var SwitchCursos: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func SwitchAceptarM(_ sender: Any) {
        if SwitchCursos .isOn == true{
            TitleLabel.text = "TU MATRICULA A SIDO ACTIVADA"
            CursosButton.isHidden = false
        } else {
            TitleLabel.text = "¿Aceptas el reglamento de matricula?"
            CursosButton.isHidden = true
        }
    }
    

}
