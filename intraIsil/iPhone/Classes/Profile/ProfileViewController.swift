//
//  ProfileViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/3/21.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var dni: UILabel!
    @IBOutlet weak var profession: UILabel!
    @IBOutlet weak var birthdate: UILabel!
    @IBOutlet weak var direction: UILabel!
    @IBOutlet weak var email: UILabel!
    var database = Database.database().reference()
    
    var nameUser:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.validateLogin()
        self.showInfoUser()
        //print(nameUser)
        //self.fullName.text = "\(nameUser!)"
    }
    
    func showInfoUser(){
        let currentUser = Auth.auth().currentUser
        self.database.child("IntraIsil").child("Usuario").queryOrdered(byChild:  "id").queryStarting(atValue: currentUser?.uid)
            .observeSingleEvent(of: .childAdded, with: { (snapshot: DataSnapshot) in
            /*var user = User()
            var users = [User]()
            for u in snapshot.children{
                user.name = u.value!["name"] as? String
                ...
                users.append(user)
            }
            self.users = users*/
            
            let user = snapshot.value as! [String: AnyObject]
                print("mmmmm", user)
            //var profile = ProfileModel(json: dictJSON)
                
                self.fullName.text = "\(user["nombre"] as? String ?? "") \(user["apellidos"] as? String ?? "")"
                self.dni.text = user["dni"] as? String ?? ""
                self.profession.text = user["profesion"] as? String ?? ""
                self.birthdate.text = user["fecha_nacimiento"] as? String ?? ""
                self.direction.text = user["direccion"] as? String ?? ""
                self.email.text = user["email"] as? String ?? ""
                
             
        })
    }
    
    
    func validateLogin(){
        if Auth.auth().currentUser == nil {
            self.showStoryboardLogin()
        }
    }

    
    @IBAction func showProfile(_ sender: Any) {
        
        self.performSegue(withIdentifier: "ProfileEdit", sender: self)
        
    }
    
    
 
    
}
extension UIViewController{
    
    @IBAction func signOut(_ sender: UIButton) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                self.showStoryboardLogin()
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        else{
            print("user nil")
        }
    }
    
    public func showStoryboardLogin(){
        //filter search storyboards
        guard let controller = self.navigationController?.viewControllers.first(where: {
            $0 is LoginViewController
        }) else { return }
        
        self.navigationController?.popToViewController(controller, animated: true)
        
    }
    
}
