//
//  LoginViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/3/21.
//
import UIKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {

    
    @IBOutlet weak var textTitleLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var textButton: UIButton! 
    @IBOutlet weak var inputDNI: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.validateCurrentLogin()
        self.inputDNI.text = "antonyhuallullo@gmail.com"
        self.inputPassword.text = "12345678"

     }
    
//    func validateCurrentLogin(){
//
//        let currentUser = Auth.auth().currentUser
//        print("currentUser", currentUser)
//        print("uid", currentUser?.uid)
//
//
//        if Auth.auth().currentUser != nil {
//            print("Mostrar user options")
//            /*let storyboard = UIStoryboard(name: "UserOptions", bundle: nil).instantiateViewController(withIdentifier: "Home")
//            present(storyboard, animated: true, completion: nil)
//            */
//            performSegue(withIdentifier: "UserOptions", sender: self)
//            //self.dismiss(animated: true, completion: nil)
//        }
//    }
//
    
    @IBAction func login(_ sender: UIButton) {
        //let nextViewController = UserOptionsViewController() as UIViewController
          //self.navigationController?.pushViewController(nextViewController, animated: true)
        
        let user = self.inputDNI.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = self.inputPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        var msj: String = ""
        
        if user == "" || password == "" {
   
            let alert = UIAlertController(title: "Error", message: "Ingrese un correo electrónico y una contraseña.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(defaultAction)
            
            self.present(alert, animated: true, completion: nil)
        
        } else {
            Auth.auth().signIn(withEmail: user, password: password) { [weak self] authResult, error in
                
                if error == nil {
                    self?.performSegue(withIdentifier: "UserOptions", sender: self)
                    //let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    //self.present(vc!, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self?.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    

    @IBAction func forgotYouPassword(_ sender: UIButton) {
        print("forgotYouPassword")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "UserOptions"{
                if let destino = segue.destination as? UserOptionsViewController{
                    destino.user = inputDNI.text
                }
            }
        }
}
