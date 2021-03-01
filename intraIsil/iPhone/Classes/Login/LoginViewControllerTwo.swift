//
//  LoginViewControllerTwo.swift
//  intraIsil
//
//  Created by user179028 on 2/5/21.
//


import UIKit
import Firebase

class LoginViewControllerTwo: UIViewController {
    
    @IBOutlet weak var textTitleLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var inputDNI: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // add custom fonts
        
        textTitleLabel.font = UIFont(name: "Montserrat-Bold", size: 22)
        userLabel.font = UIFont(name: "Montserrat-Bold", size: 18)
        passwordLabel.font = UIFont(name: "Montserrat-Bold", size: 18)
        textButton.titleLabel!.font = UIFont(name: "Montserrat-Bold", size: 20)
        
        /*
        inputDNI.borderStyle = .none
        inputDNI.layer.cornerRadius = 25.0
        inputDNI.layer.masksToBounds = true
        inputPassword.borderStyle = .none
        inputPassword.layer.cornerRadius = 25.0
        inputPassword.layer.masksToBounds = true
         */
        
        
        
        
     }
    
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func NextView(_ sender: Any) {
        
        let db = Firestore.firestore()
        
        db.collection("user").document(inputPassword.text!).addSnapshotListener { documentSnapshot, error in
            print("entro en el user ")
                if let document = documentSnapshot, error == nil {
                    print("entro en el document")
                    if let dni = document.get("DNI") as? String {
                        print("entro en el dni")
                        if dni == self.inputDNI.text! {
                            self.performSegue(withIdentifier: "NewPassword", sender: nil)
                        }
                    }
                }
            }
    }
    
    

}
