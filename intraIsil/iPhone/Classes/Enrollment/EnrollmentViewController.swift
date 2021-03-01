//
//  EnrollmentViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/3/21.
//

import UIKit
import Firebase
import FirebaseAuth

class EnrollmentViewController: UIViewController {

    
    @IBOutlet weak var lblTitleLabel: UILabel!
    @IBOutlet weak var btnCursos: UIButton!
    @IBOutlet weak var switchAceptar: UISwitch!
    @IBOutlet weak var lblDescription: UILabel!
    var database = Database.database().reference()
    var uidUsuer: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uidUsuer = Auth.auth().currentUser?.uid ?? ""
    }
    

    @IBAction func SwitchAceptarM(_ sender: Any) {
        btnCursos.isHidden = !switchAceptar.isOn
        lblTitleLabel.text = (!switchAceptar.isOn) ? "¿Aceptas el reglamento de matricula?" : "TU MATRICULA A SIDO ACTIVADA"
    }
    
    
    @IBAction func actionShowCourses(_ sender: UIButton) {

        /*let storyboard = UIStoryboard(name: "Enrollment", bundle: nil)
        let story = storyboard.instantiateViewController(identifier: "TableCourses")
        story.modalPresentationStyle = .fullScreen
        story.modalTransitionStyle = .crossDissolve
        present(story, animated: true, completion: nil)*/
        self.database.child("IntraIsil").child("Matriculas").queryOrdered(byChild: "usuario_id").queryStarting(atValue: self.uidUsuer).observeSingleEvent(of: .childAdded) { (snapshot) in

            if snapshot.childrenCount > 0{ // && self.switchAceptar.isOn == true
                self.performSegue(withIdentifier: "ListCourse", sender: self)
            }
            else {
                let data = [
                    "acepto_reglamento": (self.switchAceptar.isOn) ? "SI" : "NO",
                    "detalles": "",
                    "usuario_id": self.uidUsuer,
                ]
                self.database.child("IntraIsil/Matriculas/").childByAutoId().setValue(data)
                //if(self.switchAceptar.isOn){
                    self.performSegue(withIdentifier: "ListCourse", sender: self)
                //}
            }
        }
        
        
    }
    

}
