//
//  UserOptionsViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/3/21.
//

import UIKit
import Firebase
import FirebaseAuth

class UserOptionsViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var buttonHorarios: UIButton!
    @IBOutlet weak var buttonMatricula: UIButton!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var buttonSignOff: UIButton!
    @IBOutlet weak var fullName: UILabel!
    var database = Database.database().reference()
    
    var user:String?
    var nameUser:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.validateLogin()
        self.showInfoUser()
        
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 1.5
        buttonHorarios.layer.cornerRadius = 30
        buttonHorarios.layer.borderWidth = 1.5
        buttonMatricula.layer.cornerRadius = 30
        buttonMatricula.layer.borderWidth = 1.5
        imgUser.layer.cornerRadius = imgUser.bounds.size.width / 2.0
        buttonSignOff.layer.cornerRadius = 13
        buttonSignOff.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        buttonSignOff.layer.borderWidth = 1.5
    
        print(user)
        
        //borrar
        
        // Add a second document with a generated ID.
        //let db = Firestore.firestore()
        
        // Add a new document in collection "cities"
//        db.collection("user").document(user!).setData([
//            "name": "pancho",
//            "state": "lima",
//            "country": "peru"
//        ]) { err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
        
        
        //read
        /*let docRef = db.collection("user").document(user!)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.get("name")
                self.nameUser = "\(dataDescription!)"
                self.fullName.text = "\(dataDescription!)"
            } else {
                print("Document does not exist")
            }
        }*/
        
        //borrar
        
    }
    
    
    
    
    func showInfoUser(){
        let currentUser = Auth.auth().currentUser

        let strSearch = currentUser?.uid

        self.database.child("IntraIsil").child("Usuario").queryOrdered(byChild:  "id").queryStarting(atValue: strSearch)
            .observeSingleEvent(of: .childAdded, with: { (snapshot: DataSnapshot) in

            let user = snapshot.value as! [String: AnyObject]
            self.fullName.text = "\(user["nombre"] as? String ?? "") \(user["apellidos"] as? String ?? "")"

        })
    }
    
    func validateLogin(){
        let currentUser = Auth.auth().currentUser

        if Auth.auth().currentUser == nil {
            self.showStoryboardLogin()
        }
    }
    
    @IBAction func showProfile(_ sender: UIButton) {
        print("Profile")
        self.performSegue(withIdentifier: "Profile", sender: self)
    }
    
    @IBAction func showEnrollment(_ sender: Any) {
        self.performSegue(withIdentifier: "Enrollment", sender: self)
    }
    
    @IBAction func showSchedule(_ sender: UIButton) {
        print("Schedule")
        self.performSegue(withIdentifier: "Schedule", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "Profile"{
                if let destino = segue.destination as? ProfileViewController{
                    destino.nameUser = self.nameUser
                }
            }
    }
    
    
}
