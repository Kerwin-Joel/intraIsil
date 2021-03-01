//
//  ListCourseViewController.swift
//  intraIsil
//
//  Created by Stalin Huallullo on 27/02/21.
//

import Foundation

import UIKit
import Firebase
import FirebaseAuth

class ListCourseViewController: UIViewController, UITableViewDelegate{
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var teacher: UILabel!
    
    @IBOutlet weak var tableView: UITableView!

    var database = Database.database().reference().child("IntraIsil")
    var arraySchedule = [ScheduleBE]()

    var obj: ScheduleBE!
    
    var uidUsuer: String?
    var idCourse: String?
    var nameCourse: String?
    var nameTeacher: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.name.text = nameCourse ?? ""
        self.teacher.text = nameTeacher ?? "" //"Profesor: \(nameTeacher ?? "")"
        self.uidUsuer = Auth.auth().currentUser?.uid ?? ""
        self.cargarTabla()
    }
    
    func cargarTabla(){
        
        self.database.child("Cursos").child(self.idCourse ?? "").observe(.value, with: { (snapshot) in

            if snapshot.childrenCount > 0 {
                self.arraySchedule.removeAll()
                
                let media = snapshot.value as! [String : Any]
                for childSnapshot in media["detalles"] as! JSON {
                    let course = ScheduleBE(json: childSnapshot.value as! JSON,idSchedule: childSnapshot.key)
                    self.arraySchedule.append(course)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        })
        
    }
    
}

extension ListCourseViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arraySchedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ListCourseTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ListCourseTableViewCell
        cell.obj = self.arraySchedule[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = self.arraySchedule[indexPath.row]
        
        let alert = UIAlertController(title: "¡Alerta!", message: "¿Desea matricularse en el horario de \(obj.day) a las \(obj.hours)?", preferredStyle: UIAlertController.Style.alert)

                alert.addAction(UIAlertAction(title: "Si, matricular", style: UIAlertAction.Style.default, handler: {action in
                    let date = Date()
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd-MM-yyyy"
                    let objet: [String: Any] = [
                        "curso_id": self.idCourse!,
                        "estado": 1,
                        "fecha": formatter.string(from: date),
                        "horario": obj.idSchedule
                    ]
                    /*
                     "detalles":[
                         "curso_id": self.idCourse!,
                         "estado": 1,
                         "fecha": formatter.string(from: date),
                         "horario": obj.idSchedule
                     ]
                     **/
     
                    self.database.child("Matriculas").queryOrdered(byChild: "usuario_id").queryStarting(atValue: self.uidUsuer).observeSingleEvent(of: .childAdded) { (snapshot) in
                        
                        guard snapshot.exists() != false else {
                            return
                        }
                        
                        DispatchQueue.main.async {
                            guard let dict = snapshot.value as? [String:Any] else {
                                return
                            }
                            
                            self.database.child("Matriculas/\(snapshot.key)/detalles").childByAutoId().setValue(objet)
                            
                            guard let controller = self.navigationController?.viewControllers.first(where: {
                                $0 is CourseViewController
                            }) else { return }
                            
                            self.navigationController?.popToViewController(controller, animated: true)
                        }
                    }
                    


                        /*query.observeSingleEv ent(of: .value) { (snapshot) in
                    self.database.child("IntraIsil").child("Matriculas").queryOrdered(byChild: "usuario_id").queryStarting(atValue: self.uidUsuer).setValue(objet, forKey: "detalles")*/
                    
                        //.childByAutoId().setValue(objet)
                }))
                alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: {action in
                    print("No acepto")
                }))

                // show the alert
                self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
